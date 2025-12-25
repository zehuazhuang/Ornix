//
//  AiChatView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/16.
//
import Combine
import SwiftUI
import Foundation
// 消息模型

func getListenText(deliberadesc: String) async -> String? {
    // 构建 URL
    guard let url = URL(string: "https://api.ewgrwg.link/api/dash/scope/textIssues") else {
        print("Invalid URL")
        return nil
    }
    
    // 构建请求体
    let body: [String: Any] = [
        "system": "Dance",
        "dashScopeMessageDTOList": [
            [
                "role": "user",
                "content": deliberadesc
            ]
        ]
    ]
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    
    // 请求头
    request.setValue("11111111", forHTTPHeaderField: "appId")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    // 请求体
    do {
        request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
    } catch {
        print("JSON serialization error:", error)
        return nil
    }
    
    do {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("HTTP error")
            return nil
        }
        
        // 解析 JSON
        if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
           let result = json["result"] as? [String: Any],
           let output = result["output"] as? [String: Any],
           let choices = output["choices"] as? [[String: Any]],
           let firstChoice = choices.first,
           let message = firstChoice["message"] as? [String: Any],
           let content = message["content"] as? String {
            return content
        } else {
            print("JSON parsing error")
            return nil
        }
        
    } catch {
        print("Request error:", error)
        return nil
    }
}

struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isCurrentUser: Bool
}

struct AiChatView: View {
   
    @State private var messages: [Message] = [
           
        ]
    
    @State private var textContent: String = "" //
    
    @FocusState private var focusedField: Field?
    
    @Environment(\.dismiss) var dismiss

    enum Field {
        case content
    }
    
    var body: some View {
        
        ZStack{
            Image("asiudiq_bei")
                .resizable()
               
                .ignoresSafeArea()
            //最外层vstack
            VStack(spacing:0){
               
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
//                    Image("zxicbq_jub")
//                                    .resizable()
//                                    .frame(width: 36, height: 36)
                                   
                }.padding(.horizontal,16)
                    .padding(.top,5)
                
                
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
                    ScrollViewReader { proxy in
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
                    .scrollIndicators(.hidden)
                    .onChange(of: messages.count) { _ in
                                
                                if let lastId = messages.last?.id {
                                    withAnimation {
                                        proxy.scrollTo(lastId, anchor: .bottom)
                                    }
                                }
                            }
                }
                           
                       }
                .background(Color(
                    red: 1,
                    green: 1,
                    blue: 1,
                    opacity:0
                )) // 父视图背景
                .padding(.horizontal,16)
                //listchat end
                
                HStack{
                    HStack {
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
                                
                                sendMessage()
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
                        
                        
                    }
                }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.black.opacity(0.9))
                   
                   

            }
            //最外层vstack end
            GlobalLoadingView()
        }
        
        .onTapGesture {
            focusedField = nil
        }
    }
    
    private func sendMessage() {
            guard !textContent.isEmpty else { return }
            
            // 添加用户消息
            let userMessage = Message(text: textContent, isCurrentUser: true)
            messages.append(userMessage)
            
            let content = textContent
            textContent = ""
            
        Task {
            // 调用接口
            GlobalLoadingManager.shared.show()
            let responseText = await getListenText(deliberadesc: content)
            
            // 如果请求失败，显示默认消息
            let aiMessageText = responseText ?? "Please try again later."
            let aiMessage = Message(text: aiMessageText, isCurrentUser: false)
            GlobalLoadingManager.shared.hide()
            // 添加到消息列表（主线程）
            DispatchQueue.main.async {
                messages.append(aiMessage)
            }
        }
        }
   
    

}


