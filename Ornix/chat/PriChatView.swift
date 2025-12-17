//
//  PriChatView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/17.
//



import SwiftUI
// 消息模型


struct PriChatView: View {
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
               
                HStack(spacing:0){
                    Button(action: {}) {
                        Image("zkugcq_back")
                            .resizable()
                            .frame(width: 15, height: 10)
                            .frame(width: 36, height: 36)
                            .background(
                                Color(red: 0, green: 0, blue: 0, opacity: 0.2)
                                    .clipShape(Circle())
                            )
                        
                    }.padding(.trailing,16)
                    
                    Image("ornixIcon")
                        .resizable()
                        .frame(width: 34, height: 34)
                        .clipShape(Circle())
                        .padding(.trailing,7)
                    
                    Text("Yoolgeun")
                        .font(.system(size: 16, weight: .heavy))
                        .foregroundColor(.white)
                    
                    
                    
                    Spacer()
                    Image("zxicbq_jub")
                                    .resizable()
                                    .frame(width: 36, height: 36)
                                   
                }.padding(.horizontal,16)
                    .padding(.top,50)
                
                

                //listchat
                VStack {
                           List(messages) { message in
                               HStack(alignment:.top) {
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
                                           .padding(.trailing,12)
                                       Image("ornixIcon")
                                           .resizable()
                                           .frame(width: 34, height: 34)
                                           .clipShape(Circle())
                                   } else {
                                       Image("ornixIcon")
                                           .resizable()
                                           .frame(width: 34, height: 34)
                                           .clipShape(Circle())
                                           .padding(.trailing,12)
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
    PriChatView()
}
