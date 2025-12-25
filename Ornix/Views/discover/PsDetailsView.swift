//
//  PsDetailsView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/17.
//

import SwiftUI

struct PsDetailsView: View {
    @State private var textContent: String = "" //
    
    @FocusState private var focusedField: Field?
    
    @State var adornmentPost: DiscoverPost
    
    @State private var enhancingUser: PolishedUser?
    
    @State private var accessoryComment: [LayeringComment] = []
    
    @Environment(\.dismiss) var dismiss
    
    enum Field {
        case content
    }
    let screenHeight = UIScreen.main.bounds.height
    
    private var userMap: [Int: PolishedUser] {
            let users = AppStorageManager.shared.getUsers()
            return Dictionary(uniqueKeysWithValues: users.map {
                ($0.refinedUid, $0)
            })
        }
    
    @State private var showReport = false
    @State private var reportUserId: Int?
    @State private var showFanKui = false
    @State private var showToast = false
    @State private var toastMessage = ""

    
    var body: some View {
        ZStack{
            VStack(spacing: 0) {
                GeometryReader { geo in
                    TabView {
                        ForEach(adornmentPost.undertoneImg, id: \.self) { imgName in
                            if let uiImage = UIImage(contentsOfFile: imgName) {
                                  
                                   Image(uiImage: uiImage)
                                       .resizable()
                                       .scaledToFill()
                                       .ignoresSafeArea()
                                       .frame(
                                           width: geo.size.width,
                                           height: geo.size.height * 0.6
                                       )
                                       
                               } else {
                                  
                                   Image(imgName)
                                       .resizable()
                                       .scaledToFill()
                                       .ignoresSafeArea()
                                       .frame(
                                           width: geo.size.width,
                                           height: geo.size.height * 0.6
                                       )
                                       
                               }
                                
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .automatic))
                }
                .frame(height: UIScreen.main.bounds.height * 0.6)
                       Spacer()
                   }.ignoresSafeArea(edges: .top)
            Color.black.opacity(0.9)
                .ignoresSafeArea()
                .frame(height: 60)
                .frame(maxHeight: .infinity,alignment: .bottom)
            // comment
            VStack(spacing:0){
                Spacer()
                
                ZStack{
                    Image("iuqwundsa_bobei")
                                    .resizable()
                                    
                    Button(action:{
                        AppStorageManager.shared.toggleDiscoverPostLike(postId: adornmentPost.glamorousPid)

                        let uid = AppStorageManager.shared.getCurrentUserId()
                        if adornmentPost.sapphireLikes.contains(uid) {
                            adornmentPost.sapphireLikes.removeAll { $0 == uid }
                        } else {
                            adornmentPost.sapphireLikes.append(uid)
                        }
                    }){
                        Image(adornmentPost.sapphireLikes.contains(
                            AppStorageManager.shared.getCurrentUserId()) ? "zixuch_aixind" : "ziuhqw_huiai" )
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 27, height: 24)
                                        .opacity(0.4)
                    }.frame(width: 68,height: 68)
                        .background(.white)
                        .clipShape(Circle())
                        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topTrailing)
                        .padding(.trailing,32)
                        .offset(y:-34)
                    //滑
                    ScrollView(showsIndicators: false){
                        VStack(alignment:.leading,spacing:0){
                            HStack{
                                if let uiImage = UIImage(contentsOfFile: enhancingUser?.pairingAvatar ?? "ornixIcon") {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                }else{
                                    Image(enhancingUser?.pairingAvatar ?? "ornixIcon")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 40, height: 40)
                                                    .clipShape(Circle())
                                }
                               
                                               
                                VStack(alignment:.leading,spacing:3){
                                    Text(enhancingUser?.elegantName ?? "")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.white)
                                    Text("\(enhancingUser?.stylingFans.count ?? 0) Followers")
                                        .font(.system(size: 10, weight: .light))
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                Spacer()
                            }.padding(.bottom,24)
                            Text(adornmentPost.earthtoneText)
                                .font(.system(size: 18, weight: .regular))
                                .foregroundColor(.white.opacity(0.7))
                                .padding(.bottom,17)
                            Text("Comments")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundColor(Color(red: 237/255, green: 55/255, blue: 251/255),)
                                .padding(.bottom,13)
                            
                            
                            ForEach(accessoryComment,id:\.polishedCid) { comment in
                                let user = userMap[comment.bronzetoneUid]
                                HStack(alignment:.top){
                                    if let uiImage = UIImage(contentsOfFile: user?.pairingAvatar ?? "ornixIcon") {
                                        Image(uiImage: uiImage)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 34, height: 34)
                                            .clipShape(Circle())
                                    }else{
                                        Image(user?.pairingAvatar ?? "ornixIcon")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 34, height: 34)
                                            .clipShape(Circle())
                                    }
                                   
                                    VStack(alignment:.leading,spacing: 7){
                                        Text(user?.elegantName ?? "")
                                            .font(.system(size: 16, weight: .heavy))
                                            .foregroundColor(.white)
                                        Text(comment.proportionText)
                                            .font(.system(size: 12, weight: .light))
                                            .foregroundColor(.white.opacity(0.7))
                                    }.padding(.top,8)
                                    Spacer()
                                    if comment.bronzetoneUid != AppStorageManager.shared.getCurrentUserId() {
                                        Image("zxicbq_jub")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                            .padding(.top,8)
                                            .onTapGesture {
                                              
                                                reportUserId = comment.bronzetoneUid
                                                withAnimation { showReport = true }
                                            }
                                        
                                    }
                                   
                                }.padding(.bottom,10)
                            }
                        }
                        .frame(maxHeight: .infinity,alignment: .leading)
                    }.padding(.horizontal,16)
                        .padding(.top,24)
                        .padding(.bottom,70)
                    //滑  end
                    Color.black.opacity(0.9)
                        .ignoresSafeArea()
                        .frame(height: 70)
                        .frame(maxHeight: .infinity,alignment: .bottom)
                    ZStack{
                        
                      
                        ZStack(alignment: .leading) {
                            if textContent.isEmpty {
                                Text("Say something...")
                                    .foregroundColor(Color.white.opacity(0.5))
                                    .padding(.horizontal, 16)
                            }

                            TextField("", text: $textContent)
                                .padding(.leading,16)
                                .padding(.trailing,100)
                                .frame(height: 40)
                                .frame(maxWidth: .infinity)
                                .background(Color.white.opacity(0.1))
                                .cornerRadius(15)
                                .foregroundColor(.white)
                                .focused($focusedField, equals: .content)
                            
                            // 发送按钮
                            Button(action: {
                                if textContent == "" {
                                    return
                                }
                                
                                let newComment = LayeringComment(
                                    polishedCid: Int(Date().timeIntervalSince1970),
                                    proportionText: textContent,
                                    bronzetoneUid: AppStorageManager.shared.getCurrentUserId(),
                                    casualwearPid: adornmentPost.glamorousPid
                                )

                                AppStorageManager.shared.addLayeringComment(newComment)
                                accessoryComment.append(newComment)
                                
                                textContent = "" // 发送后清空文本
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
                        } .padding(.horizontal, 16)
                            .padding(.bottom,20)
                            .padding(.top,12)
                           
                    }.frame(maxHeight: .infinity,alignment: .bottom)
                   
                                    
                }.frame(height: UIScreen.main.bounds.height*0.5)
                 .frame(maxWidth: .infinity)
                
  
            }
            // comment end
            
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
                    if adornmentPost.oxidizedUid != AppStorageManager.shared.getCurrentUserId() {
                        Image("zxicbq_jub")
                                        .resizable()
                                        .frame(width: 36, height: 36)
                                        .onTapGesture {
                                          
                                            reportUserId = adornmentPost.oxidizedUid
                                            withAnimation { showReport = true }
                                        }
                    }
                  
                                   
                }.padding(.horizontal,16)
                    .padding(.top,55)
                Spacer()
            }.ignoresSafeArea(edges: .top)
            
            GlobalPopupView(
                    showReport: $showReport,
                    reportUserId: $reportUserId,
                    showFanKui: $showFanKui,
                    showToast: $showToast,
                    toastMessage: $toastMessage
                )
        }.onAppear {
           
            let users = AppStorageManager.shared.getUsers()
            enhancingUser = users.first { $0.refinedUid == adornmentPost.oxidizedUid }
            accessoryComment = AppStorageManager.shared.getLayeringComments(by: adornmentPost.glamorousPid)
        }.onTapGesture {
            focusedField = nil
        }
    }
}


