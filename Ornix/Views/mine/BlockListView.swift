//
//  BlockListView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/17.
//

import SwiftUI

struct BlockListView: View {
    @Environment(\.dismiss) var dismiss
    @State private var cooltoneUsers: [PolishedUser] = []
    
    
    
    var body: some View {
        ZStack{
            Image("asiudiq_bei")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing:12){
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
                    Text("Blacklist")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.trailing,36)
                    Spacer()
                }.padding(.top,55)
                
                ScrollView{
                    ForEach(cooltoneUsers,id: \.refinedUid){user in
                        HStack{
                            if let uiImage = UIImage(contentsOfFile: user.pairingAvatar) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                    .padding(.trailing,13)
                            }else{
                                Image(user.pairingAvatar)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 40, height: 40)
                                                .clipShape(Circle())
                                                .padding(.trailing,13)
                            }
                           
                            Text(user.elegantName)
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                            
                            Spacer()
                            Button(action: {
                                AppStorageManager.shared.toggleBlockUser(targetUid: user.refinedUid)
                                
                                cooltoneUsers = AppStorageManager.shared.getBlockedUsers()
                            }) {
                                                Text("Remove")
                                                    .font(.system(size: 18, weight: .bold))
                                                    .foregroundColor(.white)
                                                  
                                                    .padding(.horizontal, 16)
                                                    .padding(.vertical, 10)
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
                                                    .cornerRadius(100)
                                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
                            }
                        }.padding(.bottom,20)
                        
                    }
                }
                
            }.padding(.horizontal,16)
        }.onAppear {
            cooltoneUsers = AppStorageManager.shared.getBlockedUsers()
            
            
        }
    }

}

#Preview {
    BlockListView()
}
