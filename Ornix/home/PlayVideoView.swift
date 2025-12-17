//
//  PlayVideoView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/17.
//

import SwiftUI

struct PlayVideoView: View {
    @State private var textContent: String = "" //
    
    @FocusState private var focusedField: Field?

    enum Field {
        case content
    }
    var body: some View {
        ZStack{
            //替换成视频
            Image("asiudiq_bei")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            //最外层vstack
            VStack{
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
                    Image("zxicbq_jub")
                                    .resizable()
                                    .frame(width: 36, height: 36)
                                   
                }.padding(.horizontal,16)
                    .padding(.top,50)
                
                Spacer()
                
                VStack{
                    HStack{
                        Spacer()
                        VStack(){
                            ZStack {
                                Color.black.opacity(0.2)
                                        .clipShape(Circle())
                                        
                                Image("zixuch_aixin")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 16, height: 14)
                            }
                            .frame(width: 40, height: 40)
                            
                            Text("895")
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
                            
                            Text("321")
                                .font(.system(size: 12, weight: .light))
                                .foregroundColor(.white)
                        }
                    }
                    
                    VStack(alignment:.leading,spacing: 0){
                        HStack(){
                            Image("ornixIcon")
                                .resizable()
                                .frame(width: 34, height: 34)
                                .clipShape(Circle())
                            
                            Text("Marius")
                                .font(.system(size: 16, weight: .heavy))
                                .foregroundColor(.white)
                                
                        }.padding(.bottom,12)
                        Text("A must-read for commuters! A simple shirt paired with thin loop stud earrings exudes a low-key yet elegant charm, directly boosting one's presence")
                            .font(.system(size: 12, weight: .thin))
                            .foregroundColor(.white)
                            .padding(.bottom,24)
                      
                            
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
                                    
                                    print("发送消息: \(textContent)")
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
                            }
                       
                    }.frame(maxWidth: .infinity,alignment: .leading)
                    
                     
                }.padding(.bottom,35)
                    .padding(.horizontal,16)
            }
            //最外层vstack end
        }.onTapGesture {
            focusedField = nil
        }
    }
}

#Preview {
    PlayVideoView()
}
