//
//  ForgotView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/16.
//



import SwiftUI

struct ForgotView: View {

    
    @State private var textEmail: String = "" //
    
    @State private var textPassword: String = "" //
    
    @State private var textAgainPassword: String = "" //
    
    
    @FocusState private var focusedField: Field?

    enum Field {
        case email
        case passwordmi
        case againpassword
    }
        
        let width: CGFloat = 343
        let height: CGFloat = 44
        let gradientWidth: CGFloat = 165
        let gradientHeight: CGFloat = 40
    var body: some View {
        ZStack{
            Image("asiudiq_bei")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(alignment:.leading){
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
                .padding(.top,30)
                .padding(.leading,20)
                
                
                
                
                            ScrollView {
                                VStack(alignment:.leading) {
                                    //按钮
                                    Text("Forgot password")
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundColor(Color(
                                            red: 237 / 255,
                                            green: 55 / 255,
                                            blue: 251 / 255,
                                            opacity: 1
                                        )).padding(.bottom,60)
                                        .padding(.top,20)
                                    //按钮end
                                    Text("Email:")
                                        .font(.system(size: 18, weight: .bold))
                                        .foregroundColor(.white)
                                    
                                    ZStack(alignment: .leading) {
                                                if textEmail.isEmpty {
                                                    Text("Enter email address")
                                                        .foregroundColor(Color.white.opacity(0.5))
                                                        .padding(.horizontal, 16)
                                                }

                                                TextField("", text: $textEmail)
                                                    .padding(.horizontal, 16)
                                                    .frame(height: 48)
                                                    .frame(maxWidth: .infinity)
                                                    .background(Color.white.opacity(0.1))
                                                    .cornerRadius(15)
                                                    .foregroundColor(.white)
                                                    .focused($focusedField, equals: .email)
                                    }.padding(.bottom,24)
                                    
                                    
                                    Text("Password:")
                                        .font(.system(size: 18, weight: .bold))
                                        .foregroundColor(.white)
                                    
                                    ZStack(alignment: .leading) {
                                                if textPassword.isEmpty {
                                                    Text("Enter password")
                                                        .foregroundColor(Color.white.opacity(0.5))
                                                        .padding(.horizontal, 16)
                                                }

                                        SecureField("", text: $textPassword)
                                                    .padding(.horizontal, 16)
                                                    .frame(height: 48)
                                                    .frame(maxWidth: .infinity)
                                                    .background(Color.white.opacity(0.1))
                                                    .cornerRadius(15)
                                                    .foregroundColor(.white)
                                                    .focused($focusedField, equals: .passwordmi)
                                    }.padding(.bottom,20)
                                    
                                    Text("Password:")
                                        .font(.system(size: 18, weight: .bold))
                                        .foregroundColor(.white)
                                    
                                    ZStack(alignment: .leading) {
                                        if textAgainPassword.isEmpty {
                                            Text("Enter password")
                                                .foregroundColor(Color.white.opacity(0.5))
                                                .padding(.horizontal, 16)
                                        }
                                        
                                        SecureField("", text: $textAgainPassword)
                                            .padding(.horizontal, 16)
                                            .frame(height: 48)
                                            .frame(maxWidth: .infinity)
                                            .background(Color.white.opacity(0.1))
                                            .cornerRadius(15)
                                            .foregroundColor(.white)
                                            .focused($focusedField, equals: .againpassword)
                                    }
                                    .padding(.bottom, 60)
                                    
                                    
                                    Button(action: {}) {
                                        Text("Save")
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
                                    .frame(maxWidth: .infinity, minHeight: 50)
                                    .padding(.bottom,35)
                                           
                                }
                                .frame(maxWidth: .infinity)
                            }
                            .padding(.horizontal, 20)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
            }.padding()
        }.onTapGesture {
            focusedField = nil // 点击空白收起键盘
        }
        
    
                    
                    
    }
}

#Preview {
    ForgotView()
}
