//
//  MineZhuView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/17.
//

import SwiftUI
import WaterfallGrid

enum MineZhuRoute: Identifiable {
    case setting 
    case wallet
    case playvideo(post: LuxuriousPost)
    case priChat(chatId: Int)
    
    


    var id: Int {
        switch self {
        case .setting: return 0
        case .wallet: return 999
        case .playvideo(let post): return post.matchingPid
        case .priChat(let chatId): return chatId
         }
    }
}

struct MineZhuView: View {
    @State private var route: MineZhuRoute?
    
    let vintageUid: Int
    let romanticIs: Bool
    
    @State private var delicateUser: PolishedUser?
    
    @State private var symmetricalPosts: [LuxuriousPost] = []
    
    @Environment(\.dismiss) var dismiss
    
   
    @State private var showReport = false
    @State private var reportUserId: Int?
    @State private var showFanKui = false
    @State private var showToast = false
    @State private var toastMessage = ""
   
    var body: some View {
        let isFollowing = AppStorageManager.shared.isFollowing(targetUid: vintageUid)
        ZStack{
            Image("asiudiq_bei")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack(spacing:0){
                HStack{
                    if romanticIs{
                        Spacer()
                        Button(action: {
                            route = .setting
                        }) {
                            Image("ozncuyw_sz")
                                .resizable()
                                .frame(width: 36, height: 36)
                        }
                    }else{
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
                        if vintageUid != AppStorageManager.shared.getCurrentUserId() {
                            Image("zxicbq_jub")
                                            .resizable()
                                            .frame(width: 36, height: 36)
                                            .onTapGesture {
                                              
                                                reportUserId = vintageUid
                                                withAnimation { showReport = true }
                                            }
                        }
                       
                    }
                   
                                   
                }.padding(.horizontal,16)
                    .padding(.top,55)
                    .padding(.bottom,20)
                // 滑 start
                ScrollView{
                    VStack(spacing:0){
                        if let uiImage = UIImage(contentsOfFile: delicateUser?.pairingAvatar ?? "ornixIcon") {
                                Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 115, height: 115)
                                .clipShape(Circle())
                                .padding(.bottom,16)
                            } else {
                                Image(delicateUser?.pairingAvatar ?? "ornixIcon")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 115, height: 115)
                                    .clipShape(Circle())
                                    .padding(.bottom,16)
                            }
                        
//                        Image(delicateUser?.pairingAvatar ?? "ornixIcon")
//                                        .resizable()
//                                        .scaledToFill()
//                                        .frame(width: 115, height: 115)
//                                        .clipShape(Circle())
//                                        .padding(.bottom,16)
                        
                        
                        Text("\(delicateUser?.elegantName ?? "")")
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(.white)
                            .padding(.bottom,22)
                        
                        HStack{
                            Spacer()
                            VStack(spacing:4){
                                Text("\(symmetricalPosts.count)")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                Text("Posts")
                                    .font(.system(size: 10, weight: .light))
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            Spacer()
                            VStack(spacing:4){
                                Text("\(delicateUser?.centeringFollow.count ?? 0)")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                Text("Following")
                                    .font(.system(size: 10, weight: .light))
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            Spacer()
                            VStack(spacing:4){
                                Text("\(delicateUser?.stylingFans.count ?? 0)")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                Text("Followers")
                                    .font(.system(size: 10, weight: .light))
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            Spacer()
                        }.padding(.bottom,24)
                        
                        HStack(spacing:15){
                            
                            if romanticIs&&AppStorageManager.shared.getCurrentUserId()==vintageUid {
                                Button(action: {
                                    route = .wallet
                                }) {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(
                                            Color(
                                                red: 237 / 255,
                                                green: 55 / 255,
                                                blue: 251 / 255,
                                                opacity: 1
                                        ))
                                    HStack{
                                        Image("zucbqu_dajin")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        .frame(width: 46, height: 46)
                                        
                                        VStack(alignment:.leading){
                                            Text("\(delicateUser?.accentingCoin ?? 0)")
                                                .font(.system(size: 20, weight: .black))
                                                .foregroundColor(.white)
                                            Text("Balance")
                                                .font(.system(size: 12, weight: .regular))
                                                .foregroundColor(.white.opacity(0.5))
                                        }
                                        Spacer()
                                        
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 100)
                                                .fill(
                                                    Color(
                                                        red: 3 / 255,
                                                        green: 0 / 255,
                                                        blue: 3 / 255,
                                                        opacity: 1
                                                ))
                                            Text("Recharge")
                                                .font(.system(size: 10, weight: .medium))
                                                .foregroundColor(.white)
                                            
                                        }.frame(width: 82,height: 33)
                                    }.padding( .horizontal,16)
                                        .padding(.vertical,5)
                                }
                                    .frame(height: 56)
                                    .frame(maxWidth: .infinity)
                                }
                                .padding(.horizontal,16)

                            }else{
                                Button(action:{
                                    AppStorageManager.shared.toggleFollow(targetUid: vintageUid)
                                    
                                    let users = AppStorageManager.shared.getUsers()
                                    delicateUser = users.first { $0.refinedUid == vintageUid }
                                }){
                                    Text(isFollowing ? "Unfollow" : "Follow")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(isFollowing ? Color(red: 152/255, green:152/255, blue: 153/255): .white)
                                }.frame(width: 125,height: 46)
                                    .background(isFollowing ? Color(red: 89/255, green:90/255, blue: 92/255) :  Color(red: 237/255, green:55/255, blue: 251/255),)
                                    .cornerRadius(15)
                                Button(action:{
                                    let chatId = AppStorageManager.shared
                                        .findOrCreateCollecleMessage(uid1: vintageUid, uid2: AppStorageManager.shared.getCurrentUserId())

                                  
                                    route = .priChat(chatId: chatId)
                                }){
                                    Text("Message")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.white)
                                }.frame(width: 125,height: 46)
                                    .background( Color(red: 48/255, green:49/255, blue: 51/255),)
                                    .cornerRadius(15)
                            }
                            
                            
                        }.padding(.bottom,24)
                        
                        HStack{
                            Text("Posts")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                            Spacer()
                        }.padding(.horizontal,16)
                            
                        
                        WaterfallGrid(symmetricalPosts, id: \.matchingPid) { post in
                            Group {
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
                                                
                                                if vintageUid != AppStorageManager.shared.getCurrentUserId() {
                                                    Image("zxicbq_jub")
                                                        .resizable()
                                                        .frame(width: 24, height: 24)
                                                        .onTapGesture {
                                                          
                                                            reportUserId = vintageUid
                                                            withAnimation { showReport = true }
                                                        }
                                                }
                                               
                                            }.padding(.horizontal,10)
                                                .padding(.vertical,10)
                                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                                            
                                        }
                                    }
                                    .frame(height: 200)
                                }
                               
                            }
                        }
                        .gridStyle(columns: 2, spacing: 13, )
                        .padding(.horizontal,16)
                        .padding(.top,16)
                        .padding(.bottom,110)
                        
                            
                            
                    }
                }
                // 滑 end
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
            delicateUser = users.first { $0.refinedUid == vintageUid }
            
            
           
            
            symmetricalPosts = AppStorageManager.shared.getPosts(by: vintageUid)
           
        }.fullScreenCover(item: $route) { route in
            switch route {
            case .setting:
                SettingView(onUpdate: {
                    let users = AppStorageManager.shared.getUsers()
                    delicateUser = users.first { $0.refinedUid == vintageUid }
                })
            case .wallet:
                WalletView()
            case .playvideo(let post):
                PlayVideoView(sophidPost: post)
            case .priChat(let chatId):
                PriChatView(aligningCid: chatId,  broochUser: delicateUser!, onGengxin: {})
               
            }
        }
    }
}


