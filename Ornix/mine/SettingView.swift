//
//  SettingView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/17.
//

import SwiftUI
struct SettingRowViewText: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(
                        title == "Delete Account" ? Color(red: 237/255, green: 55/255, blue: 251/255) : .white)

                Spacer()

                Image("uiqwnvw_go")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 22, height: 22)
            }.padding(.vertical,6)
                .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

struct SettingView: View {
    var body: some View {
        ZStack{
            Image("asiudiq_bei")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing:12){
                HStack{
                    Button(action: {}) {
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
                    Text("Settings")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.trailing,36)
                    Spacer()
                }.padding(.top,55)
                   
                
                SettingRowViewText(title: "Modify personal information") {
                    print("点击了个人信息")
                }
                SettingRowViewText(title: "Blacklist") {
                    print("点击了个人信息")
                }
                SettingRowViewText(title: "Privacy Policy") {
                    print("点击了个人信息")
                }
                SettingRowViewText(title: "User Agreement") {
                    print("点击了个人信息")
                }
                SettingRowViewText(title: "Delete Account") {
                    print("点击了个人信息")
                }
                SettingRowViewText(title: "Log Out") {
                    print("点击了个人信息")
                }
                
                Spacer()
                
            }.padding(.horizontal,16)
        }
    }
}

#Preview {
    SettingView()
}
