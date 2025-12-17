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

    enum Field {
        case content
    }
    let screenHeight = UIScreen.main.bounds.height
    var body: some View {
        ZStack{
            VStack(spacing: 0) {
                       GeometryReader { geo in
                           Image("ornixIcon")
                               .resizable()
                               .scaledToFill()
                               .frame(height: geo.size.height * 0.6)
                               .clipped()
                       }
                       Spacer()
                   }.ignoresSafeArea(edges: .top)
            
            // comment
            VStack(spacing:0){
                Spacer()
                
                ZStack{
                    Image("iuqwundsa_bobei")
                                    .resizable()
                                    .scaledToFill()
                    Button(action:{}){
                        Image("ziuhqw_huiai")
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
                    ScrollView{
                        VStack(alignment:.leading,spacing:0){
                            HStack{
                                Image("ornixIcon")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 40, height: 40)
                                                .clipShape(Circle())
                                               
                                VStack(spacing:3){
                                    Text("Yoolgeun")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.white)
                                    Text("259 Followers")
                                        .font(.system(size: 10, weight: .light))
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                Spacer()
                            }.padding(.bottom,24)
                            Text("A thin silver chain and a plain ring, no need to worry about matching, can instantly add a sense of detail to a simple outfit.")
                                .font(.system(size: 18, weight: .regular))
                                .foregroundColor(.white.opacity(0.7))
                                .padding(.bottom,17)
                            Text("Comments")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundColor(Color(red: 237/255, green: 55/255, blue: 251/255),)
                                .padding(.bottom,13)
                            
                            
                            ForEach(0..<3) { index in
                                HStack(alignment:.top){
                                    Image("ornixIcon")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 34, height: 34)
                                        .clipShape(Circle())
                                    VStack(alignment:.leading,spacing: 7){
                                        Text("123")
                                            .font(.system(size: 16, weight: .heavy))
                                            .foregroundColor(.white)
                                        Text("asdsadadda")
                                            .font(.system(size: 12, weight: .light))
                                            .foregroundColor(.white.opacity(0.7))
                                    }.padding(.top,8)
                                    Spacer()
                                    Image("zxicbq_jub")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .padding(.top,8)
                                }
                            }
                        }
                        .frame(maxHeight: .infinity,alignment: .leading)
                    }.padding(.horizontal,32)
                        .padding(.top,24)
                    //滑  end
                    
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
                        } .padding(.horizontal, 32)
                            .padding(.bottom, 35)
                            .padding(.top,12)
                    }.frame(maxHeight: .infinity,alignment: .bottom)
                   
                                    
                }.frame(height: UIScreen.main.bounds.height*0.5)
                 .frame(maxWidth: .infinity)
                
  
            }.ignoresSafeArea(edges: .bottom)
            // comment end
            
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
                                   
                }.padding(.horizontal,32)
                    .padding(.top,55)
                Spacer()
            }.ignoresSafeArea(edges: .top)
        }
    }
}

#Preview {
    PsDetailsView()
}
