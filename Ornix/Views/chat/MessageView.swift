//
//  MessageView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/17.
//

import SwiftUI

struct ChatRoute: Identifiable {
    let id: Int
    let message: CollecleMessage
    let user: PolishedUser
}

struct MessageView: View {
    @State private var acrylicMessage: [CollecleMessage] = []
    
    @State private var chatRoute: ChatRoute?
    
    var body: some View {
        ZStack{
            Image("asiudiq_bei")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    Text("Chat")
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
                }
                 .padding(.top,55)
                 .padding(.horizontal,16)
                ScrollView{
                    ForEach(acrylicMessage,id: \.ornamentMid) {mes in
                        let otherUser = AppStorageManager.shared.getOtherUser(from: mes)
                        HStack(spacing:12){
                            if let uiImage = UIImage(contentsOfFile: otherUser?.pairingAvatar ?? "ornixIcon") {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                            }else{
                                Image(otherUser?.pairingAvatar ?? "ornixIcon")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 60, height: 60)
                                                .clipShape(Circle())
                            }
                            
                            
                            HStack{
                                VStack(alignment:.leading,spacing:5){
                                    Text(otherUser?.elegantName ?? "")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.white)
                                    Text(mes.matchedEndText)
                                        .font(.system(size: 12, weight: .regular))
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                Spacer()
                                Text(mes.comegrEndTime)
                                    .font(.system(size: 10, weight: .medium))
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical,10)
                             .padding(.horizontal,12)
                                .background(
                                    .white.opacity(0.1)
                                )
                                .cornerRadius(15)
                            
                        }.padding(.bottom,12)
                            .onTapGesture {
                                guard let user = otherUser else { return }

                                    chatRoute = ChatRoute(
                                        id: mes.ornamentMid,
                                        message: mes,
                                        user: user
                                    )
                            
                            }
                         
                    }.fullScreenCover(item: $chatRoute) { route in
                        PriChatView(
                            aligningCid: route.message.ornamentMid,
                            broochUser: route.user, onGengxin:{
                                getMessage()
                            }
                        )
                    }
                }.padding(.horizontal,16)
                   
            }
            
           
            
        }.onAppear {
       
            getMessage()
        }
    }
    func getMessage() {
        let manager = AppStorageManager.shared
        
        let drogynoUsers = manager.getUsers()
        let signetUser = drogynoUsers.first { $0.refinedUid == manager.getCurrentUserId() }
        
   
        acrylicMessage = manager.getCollecleMessages(by: manager.getCurrentUserId()).filter{
           let velvlaceet = (signetUser?.platinumBlock.contains($0.simplifUsers[0])) ?? false
           let ojadenyx = (signetUser?.platinumBlock.contains($0.simplifUsers[1])) ?? false
            
            return !velvlaceet && !ojadenyx
        }
    }
}

#Preview {
    MessageView()
}
