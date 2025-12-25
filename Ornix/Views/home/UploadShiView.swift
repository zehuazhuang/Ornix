//
//  UploadVideoView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/17.
//

import SwiftUI
import PhotosUI
import AVFoundation
struct PickedVideo: Transferable {
    let url: URL

    static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(contentType: .movie) { video in
            SentTransferredFile(video.url)
        } importing: { received in
            let fileExtension = received.file.pathExtension

            let uniqueURL = FileManager.default.temporaryDirectory
                .appendingPathComponent(UUID().uuidString)
                .appendingPathExtension(fileExtension)

            try FileManager.default.copyItem(
                at: received.file,
                to: uniqueURL
            )

            return PickedVideo(url: uniqueURL)
        }
    }
}

struct UploadShiView: View {
    @Environment(\.dismiss) var dismiss
    
   
    
    @State private var textWriting: String = ""
    
    @FocusState private var focusedField: Field?
    
    @State private var showPicker = false
        @State private var selectedItem: PhotosPickerItem?
        @State private var firstFrameImage: UIImage?
    @State private var savedVideoURL: URL?
    let onDismiss: () -> Void

    enum Field {

        case writing
    }
    
    var body: some View {
        ZStack{
            Image("asiudiq_bei")
                .resizable()
              
                .ignoresSafeArea()
            ScrollView{
            //start
            VStack(alignment:.leading){
                
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image("zkugcq_back")
                            .resizable()
                            .frame(width: 15, height: 10)
                            .frame(width: 36, height: 36)
                            .background(Color.black.opacity(0.2).clipShape(Circle()))
                    }
                    Spacer()
                }
                
                
                
                
                
                VStack(alignment:.leading,spacing: 12) {
                    
                    
                    
                    
                    
                    Text("Copywriting:")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                    ZStack(alignment: .topLeading) {
                        
                        if textWriting.isEmpty {
                            Text("Enter...")
                                .foregroundColor(Color.white.opacity(0.5))
                                .padding(.horizontal, 20)
                                .padding(.vertical, 12)
                        }
                        
                        
                        TextEditor(text: $textWriting)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .frame(height: 148)
                            .background(Color.clear)
                            .foregroundColor(.white)
                            .scrollContentBackground(.hidden)
                            .focused($focusedField, equals: .writing)
                    }
                    .frame(height: 148)
                    .background(.white.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.bottom, 12)
                    
                    Text("Video:")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                    
                    ZStack{
                        if let image = firstFrameImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 128, height: 168)
                                .clipped()
                                .cornerRadius(15)
                        } else {
                            
                            ZStack {
                                Circle()
                                    .fill(
                                        LinearGradient(
                                            colors: [
                                                Color(red: 152/255, green: 43/255, blue: 251/255),
                                                Color(red: 237/255, green: 55/255, blue: 251/255)
                                            ],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .frame(width: 40, height: 40)
                                
                                Image("uiqowni_add")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                            }
                        }
                        
                    }.frame(width: 128,height: 168)
                        .background(.white.opacity(0.1))
                        .cornerRadius(15)
                        .padding(.bottom,60)
                        .onTapGesture {
                            PermissionManager.checkPhotoPermission { granted in
                                if granted {
                                    showPicker = true
                                } else {
                                    print("相册权限被拒绝")
                                }
                            }
                        }.photosPicker(
                            isPresented: $showPicker,
                            selection: $selectedItem,
                            matching: .videos
                        )
                    // 选中视频后处理
                        .onChange(of: selectedItem) { newItem in
                            guard let item = newItem else { return }
                            
                            Task {
                                if let video = try? await item.loadTransferable(type: PickedVideo.self) {
                                    extractFirstFrame(from: video.url)
                                }
                            }
                        }
                    
                    Button(action: {
                        if(textWriting != "" && firstFrameImage != nil){
                            AppStorageManager.shared.addPost(
                                LuxuriousPost(
                                    matchingPid: AppStorageManager.shared.getPosts().count+1,
                                    structuredText: textWriting,
                                    pendantLikes: [],
                                    obsidianUid: AppStorageManager.shared.getCurrentUserId(),
                                    ceramicImg: saveImageToCache(firstFrameImage!) ?? "",
                                    titaniumUrl: savedVideoURL?.path ?? ""
                                )
                            )
                            onDismiss()
                            dismiss()
                        }
                    }) {
                        Text("Upload")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 14)
                            .background(
                                LinearGradient(colors: [Color(
                                    red: 152 / 255,
                                    green: 43 / 255,
                                    blue: 251 / 255,
                                    opacity: 1
                                ), Color(
                                    red: 237 / 255,
                                    green: 55 / 255,
                                    blue: 251 / 255,
                                    opacity: 1
                                )], startPoint: .leading, endPoint: .trailing)
                            )
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
                    }
                    
                  
                    
                }
                
                
                //end
            }
                    
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
            }.padding(.horizontal, 16)
        }
       
        .onTapGesture {
            focusedField = nil
        }
    }
    
    func extractFirstFrame(from url: URL) {

        // ① 先保存视频
        if let savedURL = saveVideoToDocuments(from: url) {
            print("视频已保存:", savedURL.path)
            self.savedVideoURL = savedURL   // 建议保存
        }

        // ② 再取第一帧
        let asset = AVAsset(url: url)
        let generator = AVAssetImageGenerator(asset: asset)
        generator.appliesPreferredTrackTransform = true

        let time = CMTime(seconds: 0, preferredTimescale: 600)

        do {
            let cgImage = try generator.copyCGImage(at: time, actualTime: nil)
            let image = UIImage(cgImage: cgImage)

            DispatchQueue.main.async {
                self.firstFrameImage = image
            }
        } catch {
            print("获取视频第一帧失败:", error)
        }
    }
    
    func saveImageToCache(_ image: UIImage) -> String? {
        guard let data = image.jpegData(compressionQuality: 0.8) else { return nil }

        let url = FileManager.default.temporaryDirectory
            .appendingPathComponent(UUID().uuidString)
            .appendingPathExtension("jpg")

        try? data.write(to: url)
        return url.path
    }
    func saveVideoToDocuments(from sourceURL: URL) -> URL? {

        let fileManager = FileManager.default

        let documentsURL = fileManager.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first!

        let targetURL = documentsURL
            .appendingPathComponent(UUID().uuidString)
            .appendingPathExtension(sourceURL.pathExtension)

        do {
            if fileManager.fileExists(atPath: targetURL.path) {
                try fileManager.removeItem(at: targetURL)
            }

            try fileManager.copyItem(at: sourceURL, to: targetURL)
            return targetURL
        } catch {
            print("保存视频失败:", error)
            return nil
        }
    }

}


