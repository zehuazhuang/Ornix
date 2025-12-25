//
//  PlayVideoView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/17.
//

import SwiftUI
import AVKit

struct LoopingVideoPlayerView: UIViewControllerRepresentable {

 
    let videoSource: String

    @Binding var isPlaying: Bool

   
    class Coordinator: NSObject {
        var parent: LoopingVideoPlayerView
        var player: AVPlayer?

        init(_ parent: LoopingVideoPlayerView) {
            self.parent = parent
        }

        @objc func didFinishPlaying() {
            player?.seek(to: .zero)
            if parent.isPlaying {
                player?.play()
            }
        }

        deinit {
            NotificationCenter.default.removeObserver(self)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    
    func makeUIViewController(context: Context) -> AVPlayerViewController {

        let controller = AVPlayerViewController()
        controller.showsPlaybackControls = false
        controller.videoGravity = .resizeAspectFill

        let player: AVPlayer?

      
        if FileManager.default.fileExists(atPath: videoSource) {
            let url = URL(fileURLWithPath: videoSource)
            player = AVPlayer(url: url)

       
        } else if let path = Bundle.main.path(
            forResource: videoSource,
            ofType: "mp4"
        ) {
            player = AVPlayer(url: URL(fileURLWithPath: path))

        } else {
            player = nil
        }

        controller.player = player
        context.coordinator.player = player

        if let item = player?.currentItem {
            NotificationCenter.default.addObserver(
                context.coordinator,
                selector: #selector(Coordinator.didFinishPlaying),
                name: .AVPlayerItemDidPlayToEndTime,
                object: item
            )
        }

        if isPlaying {
            player?.play()
        }

        return controller
    }

    func updateUIViewController(
        _ uiViewController: AVPlayerViewController,
        context: Context
    ) {
        if isPlaying {
            uiViewController.player?.play()
        } else {
            uiViewController.player?.pause()
        }
    }
}

extension LoopingVideoPlayerView.Coordinator {
    @objc func togglePlayPause() {
        guard let player = player else { return }
        if player.timeControlStatus == .playing {
            player.pause()
            parent.isPlaying = false
        } else {
            player.play()
            parent.isPlaying = true
        }
    }
}

struct PlayVideoView: View {
   
    
    @State private var showComments = false
    
    @Environment(\.dismiss) var dismiss
    
    @State var sophidPost: LuxuriousPost
    
    @State private var diamondUser: PolishedUser?
    
    @State private var isPlaying = true
    
    @State private var showReport = false
    @State private var reportUserId: Int?
    @State private var showFanKui = false
    @State private var showToast = false
    @State private var toastMessage = ""

   
    var body: some View {
        ZStack{
        
            
            //替换成视频
            ZStack {
                LoopingVideoPlayerView(videoSource: sophidPost.titaniumUrl ,  isPlaying: $isPlaying)
                        
                        // 点击切换播放状态
                        Color.clear
                            .contentShape(Rectangle())
                            .onTapGesture {
                              
                                         
                                           isPlaying.toggle()
                                     
                                
                               
                            }
                    }
                  
                .ignoresSafeArea()
            
            if !isPlaying {
                Image(systemName: "play.circle.fill")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.white)
                                    .shadow(radius: 10)
                                    .opacity(0.8)
            }
            

            
            //最外层vstack
            VStack{
                HStack{
                    Button(action: {
                        dismiss()
                    }) {
                        Image("zkugcq_back")
                            .resizable()
                            .frame(width: 15, height: 10)
                            .frame(width: 36, height: 36)
                            .background(
                                Color(red: 0, green: 0, blue: 0, opacity: 0.2)
                                    .clipShape(Circle())
                            )
                        
                    }
                    Spacer()
                    if sophidPost.obsidianUid != AppStorageManager.shared.getCurrentUserId() {
                        Image("zxicbq_jub")
                                        .resizable()
                                        .frame(width: 36, height: 36)
                                        .onTapGesture {
                                          
                                            reportUserId = sophidPost.obsidianUid
                                            withAnimation { showReport = true }
                                        }
                    }
                
                                   
                }.padding(.horizontal,16)
                    .padding(.top,5)
                  
                
                Spacer()
                
                VStack{
                    HStack{
                        Spacer()
                        VStack(){
                            ZStack {
                                Color.black.opacity(0.2)
                                        .clipShape(Circle())
                                        
                                Image( sophidPost.pendantLikes.contains(AppStorageManager.shared.getCurrentUserId())
                                       ? "zixuch_aixind"
                                       : "zixuch_aixin")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 16, height: 14)
                            }
                            .frame(width: 40, height: 40)
                            .onTapGesture {
                                AppStorageManager.shared.togglePostLike(postId: sophidPost.matchingPid)

                                let uid = AppStorageManager.shared.getCurrentUserId()
                                if sophidPost.pendantLikes.contains(uid) {
                                    sophidPost.pendantLikes.removeAll { $0 == uid }
                                } else {
                                    sophidPost.pendantLikes.append(uid)
                                }
                            }
                            
                            Text("\(sophidPost.pendantLikes.count )")
                                .font(.system(size: 12, weight: .light))
                                .foregroundColor(.white).padding(.bottom,5)
                            
                            ZStack {
                                Color.black.opacity(0.2)
                                        .clipShape(Circle())
                                        
                                Image("iqnidqwd_ping")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 18, height: 17.59)
                            }
                            .frame(width: 40, height: 40)
                            .onTapGesture {
                                withAnimation(.easeOut) {
                                                   showComments = true
                                               }
                            }
                            
                            Text("\(AppStorageManager.shared.getComments(by: sophidPost.matchingPid ).count)")
                                .font(.system(size: 12, weight: .light))
                                .foregroundColor(.white)
                        }
                    }
                    
                    VStack(alignment:.leading,spacing: 0){
                        HStack(){
                           
                            if let uiImage = UIImage(contentsOfFile: diamondUser?.pairingAvatar ?? "ornixIcon") {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .frame(width: 34, height: 34)
                                    .clipShape(Circle())
                            }else{
                                Image(diamondUser?.pairingAvatar ?? "ornixIcon")
                                    .resizable()
                                    .frame(width: 34, height: 34)
                                    .clipShape(Circle())
                            }
                            
                            Text(diamondUser?.elegantName ?? "")
                                .font(.system(size: 16, weight: .heavy))
                                .foregroundColor(.white)
                                
                        }.padding(.bottom,12)
                        Text(sophidPost.structuredText )
                            .font(.system(size: 12, weight: .thin))
                            .foregroundColor(.white)
                            .padding(.bottom,24)
                      
                            
                            ZStack(alignment: .leading) {
                             
                                    Text("Say something...")
                                        .foregroundColor(Color.white.opacity(0.5))
                                        .padding(.horizontal, 16)
                             

                              
                                
                                // 发送按钮
                                Button(action: {
                                }) {
                                    Image("zjkxchbqw_send")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24, height: 24)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 14)
                                        .padding(.vertical, 8)
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
                                                                       )], startPoint: .top, endPoint: .bottom)
                                        )
                                        .cornerRadius(15)
                                }.frame(maxWidth: .infinity,alignment: .trailing)
                            }
                            .background(.white.opacity(0.2))
                            .cornerRadius(15)
                            .padding(.bottom,5)
                            .onTapGesture {
                                withAnimation(.easeOut) {
                                                   showComments = true
                                               }
                            }
                        
                       
                    }.frame(maxWidth: .infinity,alignment: .leading)
                    
                     
                }
                    .padding(.horizontal,16)
            }
            //最外层vstack end
            if showComments {
                
                CommentView(refiningPid: sophidPost.matchingPid , isPresented: $showComments, onShowReport: {uid in
                    reportUserId = uid
                    withAnimation { showReport = true }
                })
                
                
            }
            
            
            GlobalPopupView(
                    showReport: $showReport,
                    reportUserId: $reportUserId,
                    showFanKui: $showFanKui,
                    showToast: $showToast,
                    toastMessage: $toastMessage
                )
            
        }.onAppear {
           
            let users = AppStorageManager.shared.getUsers()
            diamondUser = users.first { $0.refinedUid == sophidPost.obsidianUid }
           
        }
        
       
    }
}

