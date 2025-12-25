//
//  OrnixHomeView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/16.
//

import SwiftUI
import WaterfallGrid

enum HomeRoute: Identifiable {
    case aichat
    case playvideo(post: LuxuriousPost)
    case uploadShi(onDismiss: () -> Void)
    case mineZhu(userId: Int)
    
    var id: Int {
        switch self {
        case .aichat: return 0
        case .playvideo(let post): return post.matchingPid
        case .uploadShi: return 999
        case .mineZhu(let userId): return userId
         }
        }
    
}

struct OrnixHomeView: View {
    @State private var route: HomeRoute?
    
    @State private var loginUser: PolishedUser?
    
    @State private var mixingUsers: [PolishedUser] = []
    
    @State private var earringsPosts: [LuxuriousPost] = []
    
    @State private var showDialog = false
    
    @State private var amethystUid = -1
    
    
    
  
    
    @State private var showPlayVideo = false
    
    let onShowReport: (Int) -> Void
        

      
    var body: some View {
        ZStack{
            Image("asiudiq_bei")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment:.leading,spacing: 0){
                    HStack{
                        Text("Ornix")
                            .font(.system(size: 38, weight: .black))
                                    .foregroundStyle(
                                        LinearGradient(
                                            colors: [
                                                Color(red: 152/255, green: 43/255, blue: 251/255),
                                                Color(red: 236/255, green: 55/255, blue: 250/255)
                                            ],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                        Spacer()
                        if let user = loginUser {
                            if let uiImage = UIImage(contentsOfFile: user.pairingAvatar.isEmpty ? "ornixIcon" : user.pairingAvatar) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                Image(user.pairingAvatar.isEmpty ? "ornixIcon" : user.pairingAvatar)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            }
                            
                                   
                                   
                                } else {
                                    Circle()
                                        .fill(Color.gray.opacity(0.3))
                                        .frame(width: 40, height: 40)
                                   
                                }
                                        
                    }.padding(.horizontal,20)
                     .padding(.top,50)
                    
                    ZStack{
                        Image("zxcwiqu_gribei")
                            .resizable()
                            .scaledToFill()
                        
                        VStack(alignment:.leading){
                            Text("Ornix AI")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                            Text("Don't know how to make your \naccessory combinations stand out? \nLeave it to the AI assistant to handle.")
                                .font(.system(size: 10, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.bottom,14)
                            Image("iuqwhd_go")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 143, height: 36)
                            Spacer()
                        }.frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading,13)
                            .padding(.top,13)
                        
                        Button(action: {}) {
                            HStack(spacing:0){
                                Image("zxnciuq_coin")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 20, height: 20)
                                               
                                Text("-300")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(Color(
                                        red: 25 / 255,
                                        green: 26 / 255,
                                        blue: 28 / 255,
                                        opacity: 1
                                    ))
                            }
                                                .frame(width:68,height: 28)
                                                .background(
                                                    LinearGradient(colors: [ Color(
                                                        red: 255 / 255,
                                                        green: 235 / 255,
                                                        blue: 59 / 255,
                                                        opacity: 1
                                                    ),
                                                                             Color(
                                                                                 red: 255 / 255,
                                                                                 green: 141 / 255,
                                                                                 blue: 26 / 255,
                                                                                 opacity: 1
                                                                             )], startPoint: .top, endPoint: .bottom)
                                                )
                                                .cornerRadius(100)
                                               
                                        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)

                    }
                    .frame(width: 343,height: 156)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 20)
                    .onTapGesture {
                        showDialog = true
                    }
                    
                    
                }.padding(.bottom,20)
                //ai stack
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 13) {
                        ForEach(mixingUsers, id: \.refinedUid) { user in
                            let isFollowing = AppStorageManager.shared.isFollowing(targetUid: user.refinedUid)
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(
                                    red: 1,
                                    green: 1,
                                    blue: 1,
                                    opacity: 0.1
                                ))
                                
                                .frame(width: 136, height: 168)
                                .overlay(
                                    ZStack{
                                        VStack(alignment:.leading, spacing:0){
                                            if let uiImage = UIImage(contentsOfFile: user.pairingAvatar) {
                                                Image(uiImage: uiImage)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 60, height: 60)
                                                    .clipShape(Circle())
                                                    .padding(.bottom,6)
                                                    .onTapGesture {
                                                       
                                                        route = .mineZhu(userId: user.refinedUid)
                                                        
                                                    }
                                            } else {
                                                Image(user.pairingAvatar)
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                .frame(width: 60, height: 60)
                                                                .clipShape(Circle())
                                                                .padding(.bottom,6)
                                                                .onTapGesture {
                                                                   
                                                                    route = .mineZhu(userId: user.refinedUid)
                                                                    
                                                                }
                                            }
                                         
                                            Text(user.elegantName)
                                                .font(.system(size: 16, weight: .bold))
                                                .foregroundColor(.white)
                                                .padding(.bottom,3)
                                            Text("\(user.stylingFans.count) Followers")
                                                .font(.system(size: 10, weight: .semibold))
                                                .foregroundColor(Color(
                                                    red: 1,
                                                    green: 1,
                                                    blue: 1,
                                                    opacity: 0.5
                                                )).padding(.bottom,11)
                                            Button(action:{
                                                AppStorageManager.shared.toggleFollow(targetUid: user.refinedUid)
                                                
                                                let manager = AppStorageManager.shared
                                                let rosetoneusers = manager.getUsers()
                                                
                                                mixingUsers = rosetoneusers.filter{$0.refinedUid != manager.getCurrentUserId()}
                                            }) {
                                                Text(isFollowing ? "- Unfollow" : "+ Follow")
                                                    .font(.system(size: 12, weight: .semibold))
                                                    .frame(width: 76, height: 27)
                                                            .background( isFollowing ? Color(red: 89/255, green:90/255, blue: 92/255) :  Color(red: 237/255, green:55/255, blue: 251/255))
                                                            .foregroundColor(isFollowing ? Color(red: 152/255, green:152/255, blue: 153/255): .white)
                                                            .cornerRadius(20)
                                                        }
                                            Spacer()
                                            
                                            
                                            
                                        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                            .padding(.top,13)
                                            .padding(.leading,13)
                                        
                                        
                                        Image("zxicbq_jub")
                                                        .resizable()
                                                        .frame(width: 24, height: 24)
                                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                                        .padding(.top,9)
                                                        .padding(.trailing,9)
                                                        .onTapGesture {
                                                      
                                                            onShowReport(user.refinedUid)
                                                        }
                                                        
                                        
                                    }
                                )
                        }
                    }
                    .padding(.horizontal)
                }.padding(.bottom,10)
                //ai stack
                
                Text("Recommended")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding(.leading,20)
                  
                //瀑布流
                ScrollView {
                    WaterfallGrid(earringsPosts, id: \.matchingPid) { post in
                        Group {
                            if post.matchingPid == -1 {
                                
                                Image("zkxjbcu_gofa")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 106)
                                    .frame(maxWidth: .infinity)
                                    .onTapGesture {
                                        route = .uploadShi{
                                         
                                            earringsPosts = AppStorageManager.shared.getPosts()
                                        }
                                    }
                                   
                                               
                               
                            } else {
                                Button {
                                    route = .playvideo(post: post)
                                } label: {
                                    GeometryReader { geo in
                                        ZStack{
                                            
                                            if let uiImage = UIImage(contentsOfFile: post.ceramicImg) {
                                                Image(uiImage: uiImage)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: geo.size.width, height: geo.size.height)
                                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                                    .clipped()
                                            } else {
                                                Image(post.ceramicImg)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: geo.size.width, height: geo.size.height)
                                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                                    .clipped()
                                            }
                                            
                                            HStack{
                                                HStack {
                                                    Image(post.pendantLikes.contains(AppStorageManager.shared.getCurrentUserId())
                                                          ? "zixuch_aixind"
                                                          : "zixuch_aixin")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 16, height: 14)
                                                    Text("\(post.pendantLikes.count)")
                                                        .font(.system(size: 12, weight: .light))
                                                        .foregroundColor(.white)
                                                }
                                                .frame(width: 58, height: 24)
                                                .background(
                                                    RoundedRectangle(cornerRadius: 100)
                                                        .fill(Color(
                                                            red: 0,
                                                            green: 0,
                                                            blue: 0,
                                                            opacity: 0.2
                                                        ))
                                                )
                                                .foregroundColor(.white)
                                                
                                                Spacer()
                                                
                                                if post.obsidianUid != AppStorageManager.shared.getCurrentUserId() {
                                                    Image("zxicbq_jub")
                                                        .resizable()
                                                        .frame(width: 24, height: 24)
                                                        .onTapGesture {
                                                            
                                                          
                                                            onShowReport(post.obsidianUid)
                                                           
                                                        }
                                                }
                                             
                                            }.padding(.horizontal,10)
                                                .padding(.vertical,10)
                                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                                            
                                        }
                                    }.frame(height: 200)
                                }
                            }
                        }
                    }
                    .gridStyle(columns: 2, spacing: 13)
                    .padding()
                }.padding(.bottom,100)
                //瀑布流end
                
            }
            //滑 end
            if showDialog {
                ZhiFuTanView(isPresented: $showDialog){
                    //跳转ai界面
                    showDialog = false
                    
                    route = .aichat
                }
                        }
            
           
            
            
        }.onAppear {
            let manager = AppStorageManager.shared
            if loginUser == nil {
                    
                let uid = manager.getCurrentUserId()
                guard uid != -1 else { return }
                    let users = manager.getUsers()
                    loginUser = users.first { $0.refinedUid == uid }
            }
            
           
                let rosetoneusers = manager.getUsers()
                
            mixingUsers = rosetoneusers.filter {
                $0.refinedUid != manager.getCurrentUserId() &&
                !(loginUser?.platinumBlock.contains($0.refinedUid) ?? false)
            }
            
            
            
            earringsPosts = manager.getPosts().filter{
                !(loginUser?.platinumBlock.contains($0.obsidianUid) ?? false)
            }
            earringsPosts.insert(LuxuriousPost.default, at: 0)
            
            
        }.fullScreenCover(item: $route) { route in
            switch route {
            case .aichat:
                AiChatView()
            case .playvideo(let post):
               
                PlayVideoView(sophidPost: post)
            case .uploadShi(let onDismiss):
                UploadShiView(onDismiss: onDismiss)
            case .mineZhu(let userId):
                MineZhuView(vintageUid: userId, romanticIs: false)
          

               
            }
        }
    }
    
    
}



