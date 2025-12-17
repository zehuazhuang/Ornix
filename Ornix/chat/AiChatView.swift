//
//  AiChatView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/16.
//

import SwiftUI
// 消息模型
struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isCurrentUser: Bool // 是否是当前用户
}

struct AiChatView: View {
    @State private var messages: [Message] = [
            Message(text: "Hi! How are you?", isCurrentUser: false),
            Message(text: "I'm good, thanks! And you?", isCurrentUser: true),
            Message(text: "Doing well. Are you free tomorrow?", isCurrentUser: false),
            Message(text: "Yes, let's meet.", isCurrentUser: true)
        ]
    
    @State private var textContent: String = "" //
    
    @FocusState private var focusedField: Field?

    enum Field {
        case content
    }
    
    var body: some View {
        
        ZStack{
            Image("asiudiq_bei")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            //最外层vstack
            VStack(spacing:0){
               
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
                
                
                //ai 引导
                ZStack{
                    ZStack{
                        Image("iuhiud_bei")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 126)
                            .frame(maxWidth:.infinity,alignment: .bottom)
                        
                        VStack(alignment:.leading){
                            Text("Ornix AI")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                            Text("Welcome to use! Tell me your style \npreferences and the occasions you \noften wear them, and I will customize \na super suitable accessory matching \nplan for you")
                                .font(.system(size: 10, weight: .semibold))
                                .foregroundColor(Color(
                                    red: 1,
                                    green: 1,
                                    blue: 1,
                                    opacity: 0.7
                                ))
                               
                           
                            Spacer()
                        }.frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading,13)
                            .padding(.top,13)
                    }
                        .frame(height: 126)
                        .frame(maxWidth:.infinity,maxHeight: 160, alignment: .bottom)
                        
                    Image("ixzuhcw_nvh")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 126)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        .padding(.top,20)
                    
                }.frame(height: 160)
                    .frame(maxWidth:.infinity)
                    .padding(.horizontal,16)
                    .padding(.bottom,40)
                //ai 引导 end
                //listchat
                VStack {
                           List(messages) { message in
                               HStack {
                                   if message.isCurrentUser {
                                       Spacer()
                                       Text(message.text)
                                           .padding()
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
                                           .foregroundColor(.white)
                                           .cornerRadius(15)
                                   } else {
                                       Text(message.text)
                                           .padding()
                                           .background(Color(
                                            red: 89 / 255,
                                            green: 90 / 255,
                                            blue: 92 / 255,
                                            opacity: 1
                                        ))
                                           .foregroundColor(.white)
                                           .cornerRadius(15)
                                       Spacer()
                                   }
                               }
                               .listRowSeparator(.hidden)
                               .listRowBackground(Color.clear)
                               .listRowInsets(EdgeInsets())
                               .padding(.vertical, 15)
                               
                           }
                           .listStyle(PlainListStyle())
                           .scrollContentBackground(.hidden)
                       }
                .background(Color(
                    red: 1,
                    green: 1,
                    blue: 1,
                    opacity:0
                )) // 父视图背景
                .padding(.horizontal,16)
                //listchat end
                
               
                ZStack{
                    Color.black
                            .frame(height: 86)
                            .frame(maxWidth: .infinity)
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
                    } .padding(.horizontal, 16)
                        .padding(.bottom, 35)
                        .padding(.top,12)
                }

                
                Spacer()
               
            }
            //最外层vstack end
        }
    }
}

#Preview {
    AiChatView()
}
