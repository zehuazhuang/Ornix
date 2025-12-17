//
//  CommentView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/17.
//

import SwiftUI
struct Comment: Identifiable {
    let id = UUID()
    let user: String
    let content: String
}

struct CommentListView: View {

    let comments: [Comment]

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading,spacing: 16) {
                ForEach(comments) { comment in
                    HStack(alignment:.top){
                        Image("ornixIcon")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 34, height: 34)
                                        .clipShape(Circle())
                        VStack(alignment:.leading,spacing: 7){
                            Text(comment.user)
                                    .font(.system(size: 16, weight: .heavy))
                                    .foregroundColor(.white)
                            Text(comment.content)
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
            .padding(.top, 12)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct CommentView: View {
    
    @State private var isPresented = true
       let panelHeight: CGFloat = 490
    
    let mockComments: [Comment] = [
        Comment(user: "Alice", content: "这个评论组件写得不错 👍"),
        Comment(user: "Bob", content: "SwiftUI 的底部弹窗终于搞明白了"),
        Comment(user: "Charlie", content: "背景图铺到安全区这个点很关键"),
        Comment(user: "Daisy", content: "支持一下作者"),
        Comment(user: "Evan", content: "键盘处理这块以前总踩坑")
    ]
    
    @State private var textContent: String = "" //
    
    @FocusState private var focusedField: Field?

    enum Field {
        case content
    }
    var body: some View {
        ZStack(alignment: .bottom) {

          
            if isPresented {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.easeOut) {
                            isPresented = false
                        }
                    }
            }

            
            ZStack {
               
                Image("iuzxhcw_combei")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(edges: .bottom)

                
                VStack(alignment:.leading) {
                    Text("Comments")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Color(red: 237/255, green: 55/255, blue: 251/255),)
                    
                    CommentListView(comments: mockComments)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity,alignment:.leading)
                .padding(.horizontal,16)
                .padding(.bottom, 12)
                .padding(.top,34)
            }
            .frame(height: panelHeight)
            .frame(maxWidth: .infinity)
            .offset(y: isPresented ? 0 : panelHeight)
            .animation(.easeOut(duration: 0.25), value: isPresented)
            
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
        }
        .ignoresSafeArea(
        //    .keyboard,
            edges: .bottom)
    }
}

#Preview {
    CommentView()
}
