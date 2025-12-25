//
//  LoginView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/16.
//

import SwiftUI
import AlertToast

struct RootView: View {
    @State private var isLoggedIn = false
    
    let iecheadban : String
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            Group {
                if isLoggedIn {
                    NavBarView()
                        .transition(.move(edge: .trailing))
                } else {
                    LoginView(isLoggedIn: $isLoggedIn, sleatheru: iecheadban)
                        .transition(.move(edge: .trailing))
                }
            }
        }
        .animation(.easeInOut, value: isLoggedIn)
    }
}

struct LoginView: View {
    @State private var showToast = false
    @State private var toastMessage = ""
    @Binding var isLoggedIn: Bool
  
    
    @State  var sleatheru : String
    
    @State private var textEmail: String = ""
    
    @State private var textPassword: String = ""
    
    @State private var textAgainPassword: String = ""
    
    @State private var showForgot: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    
    @FocusState private var focusedField: Field?

    enum Field {
        case email
        case password
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
                   
                    .ignoresSafeArea()
                
                VStack(alignment:.leading){
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
                    .padding(.top,5)
                    .padding(.leading,16)
                    
                    
                    
                    
                    ScrollView {
                        VStack(alignment:.leading) {
                            //按钮
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: 100)
                                    .fill(Color.white.opacity(0.1))
                                    .frame(width: width, height: height)
                                
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color(red: 152/255, green: 43/255, blue: 251/255),
                                                Color(red: 237/255, green: 55/255, blue: 251/255)
                                            ]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                                    .frame(width: gradientWidth, height: gradientHeight)
                                    .offset(x: sleatheru == "Sign in" ? -(width/2 - gradientWidth/2) : (width/2 - gradientWidth/2))
                                    .animation(.easeInOut(duration: 0.3), value: sleatheru)
                                
                                
                                HStack {
                                    Button(action: {
                                        withAnimation {
                                            sleatheru = "Sign in"
                                        }
                                    }) {
                                        Text("Sign in")
                                            .font(.system(size: 16, weight: .bold))
                                            .foregroundColor(.white)
                                            .frame(width: gradientWidth, height: height)
                                    }
                                    
                                    Button(action: {
                                        withAnimation {
                                            sleatheru = "Sign up"
                                        }
                                    }) {
                                        Text("Sign up")
                                            .font(.system(size: 16, weight: .bold))
                                            .foregroundColor(.white)
                                            .frame(width: gradientWidth, height: height)
                                    }
                                }
                                .frame(width: width, height: height)
                            }
                            .padding(.bottom,68)
                            .frame(maxWidth: .infinity,alignment: .center)
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
                                    .focused($focusedField, equals: .password)
                            }.padding(.bottom,20)
                            
                            VStack(alignment: .leading) {
                                if sleatheru == "Sign in" {
                                    Text("FORGOT?")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(Color(red: 237/255, green: 55/255, blue: 251/255))
                                        .underline(true, color: Color(red: 237/255, green: 55/255, blue: 251/255))
                                        .padding(.leading, 15)
                                        .padding(.bottom, 50)
                                        .onTapGesture {
                                            showForgot = true
                                        }
                                        .fullScreenCover(isPresented: $showForgot) {
                                            ForgotView()
                                                }
                                    
                                    
                                } else if sleatheru == "Sign up" {
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
                                    .padding(.bottom, 20)
                                }
                            }.padding(.bottom,60)
                            
                            
                            Button(action: {
                                
                                if(textEmail == "" || textPassword == ""){
                                    showToast = true
                                    toastMessage = "Please enter your email address and password."
                                    return
                                }
                                
                                
                                if sleatheru == "Sign in" {
                                    let users = AppStorageManager.shared.getUsers()
                                    
                                    if let loginUser = users.first(where: {
                                        $0.anchoringEmail == textEmail &&
                                        $0.crystalsPassword == textPassword
                                    }) {
                                        GlobalLoadingManager.shared.show()
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                                            GlobalLoadingManager.shared.hide()
                                            
                                            AppStorageManager.shared.saveCurrentUserId(loginUser.refinedUid)
                                            isLoggedIn = true
                                        }
                                      
                                    }else{
                                        
                                        showToast = true
                                        toastMessage = "Please check if your email address or password is incorrect."
                                    }
                                }else{
                                    let manger = AppStorageManager.shared;
                                    let newUid = manger.addUser(
                                        anchoringEmail : textEmail,
                                        crystalsPassword : textPassword
                                    )
                                    
                                    manger.saveCurrentUserId(newUid)
                                }
                            }) {
                                Text(sleatheru)
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
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                GlobalLoadingView()
            }
            .toast(isPresenting: $showToast) {
                        AlertToast(type: .regular, title: toastMessage)
                    }
            .onTapGesture {
                focusedField = nil
            }
            
            
            
       
    }
}

