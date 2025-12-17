//
//  UploadVideoView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/17.
//

import SwiftUI

struct UploadShiView: View {
    
    @State private var textTitle: String = ""
    
    @State private var textWriting: String = ""
    
    @FocusState private var focusedField: Field?

    enum Field {
        case title
        case writing
    }
    
    var body: some View {
        ZStack{
            Image("asiudiq_bei")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            //start
            VStack(alignment:.leading){
                            HStack {
                                Button(action: {
                                    print("返回")
                                }) {
                                    Image("zkugcq_back")
                                        .resizable()
                                        .frame(width: 15, height: 10)
                                        .frame(width: 36, height: 36)
                                        .background(Color.black.opacity(0.2).clipShape(Circle()))
                                }
                                Spacer()
                            }
                            .padding(.top, 50)
                            
                           
                    ScrollView {
                        VStack(alignment:.leading,spacing: 12) {
                                    Text("Title:")
                                        .font(.system(size: 18, weight: .medium))
                                        .foregroundColor(.white)
                                    ZStack(alignment: .leading) {
                                                if textTitle.isEmpty {
                                                    Text("Enter the title")
                                                        .foregroundColor(Color.white.opacity(0.5))
                                                        .padding(.horizontal, 16)
                                                }

                                                TextField("", text: $textTitle)
                                                    .padding(.horizontal, 16)
                                                    .frame(height: 48)
                                                    .frame(maxWidth: .infinity)
                                                    .background(Color.white.opacity(0.1))
                                                    .cornerRadius(15)
                                                    .foregroundColor(.white)
                                                    .focused($focusedField, equals: .title)
                                    }.padding(.bottom,12)
                            Text("Copywriting:")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.white)
                            ZStack(alignment: .topLeading) {
                                
                                if textWriting.isEmpty {
                                    Text("Enter...")
                                        .foregroundColor(Color.white.opacity(0.5))
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 12)
                                }

                                
                                TextEditor(text: $textWriting)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .frame(height: 148)
                                    .background(Color.clear)
                                    .foregroundColor(.white)
                                    .scrollContentBackground(.hidden)
                                    .focused($focusedField, equals: .writing)
                            }
                            .frame(height: 148)
                            .background(.white.opacity(0.1))
                            .cornerRadius(15)
                            .padding(.bottom, 12)
                            
                            Text("Video:")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.white)
                            
                            ZStack{
                                Circle()
                                        .fill(
                                            LinearGradient(
                                                colors: [
                                                    Color(red: 152/255, green: 43/255, blue: 251/255),
                                                    Color(red: 237/255, green: 55/255, blue: 251/255)
                                                ],
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                        .frame(width: 40, height: 40)

                                  
                                    Image("uiqowni_add")
                                        .resizable()
                                        .frame(width: 16, height: 16)
                                
                            }.frame(width: 128,height: 168)
                                .background(.white.opacity(0.1))
                                .cornerRadius(15)
                                .padding(.bottom,60)
                            
                            Button(action: {}) {
                                                Text("Upload")
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
                                                        )], startPoint: .leading, endPoint: .trailing)
                                                    )
                                                    .cornerRadius(15)
                                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
                                            }
                            
                        }
                        
                        //end
                    }
            }.padding(.horizontal, 16)
        }
    }
}

#Preview {
    UploadShiView()
}
