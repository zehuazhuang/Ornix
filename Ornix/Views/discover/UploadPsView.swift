

import SwiftUI
import PhotosUI
import AVFoundation

struct UploadPsView: View {
  
    
    @State private var textWriting: String = ""
    
    @FocusState private var focusedField: Field?
    
    @Environment(\.dismiss) var dismiss
    
    @State private var showPhotoPicker = false
 
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedImages: [UIImage] = []
    
    @State private var selectedImage: UIImage?
    
    let onDismiss: () -> Void

    enum Field {
        case title
        case writing
    }
    
    func saveImageToLocal(_ image: UIImage) -> String? {
        guard let data = image.jpegData(compressionQuality: 0.8) else {
            return nil
        }

        let fileName = UUID().uuidString + ".jpg"
        let url = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(fileName)

        do {
            try data.write(to: url)
            return url.path  
        } catch {
            print(error)
            return nil
        }
    }
    
    var body: some View {
        ZStack{
            Image("asiudiq_bei")
                .resizable()
              
                .ignoresSafeArea()
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
                            .padding(.top, 5)
                            
                           
                    ScrollView {
                        VStack(alignment:.leading,spacing: 12) {
                                  
                            Text("Copywriting:")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.white)
                                .padding(.top,30)
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
                            
                            Text("Picture:")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.white)
                            
                            ZStack{
                                if selectedImages.isEmpty{
                                    ZStack{
                                        Circle()
                                                .fill(
                                                    LinearGradient(
                                                        colors: [
                                                            Color(red: 152/255, green: 43/255, blue: 251/255),
                                                            Color(red: 237/255, green: 55/255, blue: 251/255)
                                                        ],
                                                        startPoint: .top,
                                                        endPoint: .bottom
                                                    )
                                                )
                                                .frame(width: 40, height: 40)

                                          
                                            Image("uiqowni_add")
                                                .resizable()
                                                .frame(width: 16, height: 16)
                                    }.frame(width: 128, height: 168)
                                        .background(.white.opacity(0.1))
                                        .cornerRadius(15)
                                }else{
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 12) {
                                            ForEach(selectedImages.indices, id: \.self) { index in
                                                Image(uiImage: selectedImages[index])
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 128, height: 168)
                                                    .clipped()
                                                    .cornerRadius(15)
                                            }
                                        }
                                        .frame(minWidth: UIScreen.main.bounds.width - 32, alignment: .leading)
                                    }
                                }
                              
                                
                      
                                
                            }.frame(height: 168)
                               
                                .padding(.bottom,60)
                                .onTapGesture {
                                    PermissionManager.checkPhotoPermission { granted in
                                        if granted {
                                            showPhotoPicker = true
                                        }
                                    }
                                }.photosPicker(
                                    isPresented: $showPhotoPicker,
                                    selection: $selectedItems,
                                    maxSelectionCount: 3,
                                    matching: .images
                                ).onChange(of: selectedItems) { newItems in
                                    guard !newItems.isEmpty else { return }

                                    Task {
                                        selectedImages.removeAll()

                                        for item in newItems {
                                            if let data = try? await item.loadTransferable(type: Data.self),
                                               let image = UIImage(data: data) {
                                                selectedImages.append(image)
                                            }
                                        }

                                      
                                        selectedItems.removeAll()
                                    }
                                }
                            
                            
                            Button(action: {
                                if(textWriting != "" && !selectedImages.isEmpty){
                                    let imagePaths: [String] = selectedImages.compactMap {
                                        saveImageToLocal($0)
                                    }
                                    AppStorageManager.shared.addDiscoverPost(
                                        DiscoverPost(
                                            glamorousPid: AppStorageManager.shared.getDiscoverPosts().count+1,
                                            earthtoneText: textWriting,
                                            sapphireLikes: [],
                                            oxidizedUid:AppStorageManager.shared.getCurrentUserId(),
                                            undertoneImg:imagePaths,
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
            }.padding(.horizontal, 16)
        }.onTapGesture {
            focusedField = nil
        }
    }
}


