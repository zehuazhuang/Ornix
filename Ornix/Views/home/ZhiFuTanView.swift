//
//  ZhiFuTanView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/16.
//

import SwiftUI

struct ZhiFuTanView: View {
    @Binding var isPresented: Bool
    
    @State private var showNoMoneyAlert = false
    @State private var showRecharge = false
    var onRecharge: () -> Void
    
    var body: some View {
        
        ZStack{
            Color.black.opacity(0.6)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    withAnimation(.spring()) {
                        isPresented = false
                    }
                }
        VStack{
            ZStack{
                Image("qwindiuat_bei")
                    .resizable()
                    .scaledToFill()
                
                
                Image("ixzuhcw_nvh")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 125, height: 159)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
                VStack{
                    Spacer()
                    VStack(spacing:0){
                        Text("Ornix AI")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        Color(red: 152/255, green: 43/255, blue: 251/255),
                                        Color(red: 236/255, green: 55/255, blue: 250/255)
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            ).padding(.bottom,16)
                        
                        
                        Text("Are you sure you want to")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color(
                                red: 94 / 255,
                                green: 94 / 255,
                                blue: 96 / 255,
                                opacity: 1
                            ))
                        
                        HStack(spacing:0){
                            Text("pay")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color(
                                    red: 94 / 255,
                                    green: 94 / 255,
                                    blue: 96 / 255,
                                    opacity: 1
                                ))
                            Text("300")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color(
                                    red: 237 / 255,
                                    green: 55 / 255,
                                    blue: 251 / 255,
                                    opacity: 1
                                ))
                            Text(" coins to unlock and")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color(
                                    red: 94 / 255,
                                    green: 94 / 255,
                                    blue: 96 / 255,
                                    opacity: 1
                                ))
                        }
                        Text("use the AI function?")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color(
                                red: 94 / 255,
                                green: 94 / 255,
                                blue: 96 / 255,
                                opacity: 1
                            )).padding(.bottom,31)
                        
                        
                        Button(action: {
                            
                            
                            if let moderNum = AppStorageManager.shared.getUsers()
                                .first(where: { $0.refinedUid == AppStorageManager.shared.getCurrentUserId() })?
                                .accentingCoin {
                                
                                if moderNum >= 300 {
                                    let manager = AppStorageManager.shared
                                    manager.updateUser(uid: manager.getCurrentUserId()) { user in
                                        var modified = user
                                        modified.accentingCoin -= 300
                                        
                                        return modified
                                    }
                                   
                                    onRecharge()
                                } else {
                                    
                                    withAnimation(.spring()) {
                                                                               showNoMoneyAlert = true
                                                                           }
                                }
                            }
                        }) {
                            Text("Sure")
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
                                    )], startPoint: .top,
                                                   endPoint: .bottom)
                                )
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
                        }
                        .frame(maxWidth: 235, minHeight: 50)
                        .padding(.bottom,20)
                        
                    }.background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(red: 1, green: 1, blue: 1, opacity: 1),
                                        Color(red: 1, green: 1, blue: 1, opacity: 0)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .frame(width: 265, height: 231)
                    ).padding(.bottom,40)
                    
                    
                }
                
                
                
                
                
            }.frame(width: 285,height: 393)
              
            
            Button(action: {
                isPresented = false
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .background(Color.white.opacity(0.2))
                    .clipShape(Circle())
            }
        }
            if showNoMoneyAlert {
                YubuZuView(isFeminine:$showNoMoneyAlert){
                  
                    showRecharge = true
                }
            }
            
        }.transition(.scale.combined(with: .opacity))
            .fullScreenCover(isPresented: $showRecharge) {
                WalletView()
            }
    }
}


