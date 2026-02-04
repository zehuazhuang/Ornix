

import SwiftUI

enum InitRoute: Identifiable {
    case login
    case register
    case collarprivacy

    var id: Int { hashValue }
}

struct ChooseInitView: View {
    @State private var isChecked: Bool = true
    
    
    @State private var route: InitRoute?
    
    @State private var stackingUrl: String = ""
    
    @State private var rubemeraldy: String = "Sign in"
    
    
    
    var body: some View {
        
            ZStack {
                Image("askdwqe_bei")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Image("ornixIcon")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .cornerRadius(28)
                        .padding(.bottom,16)
                    Text("Joti")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.bottom,60)
                    Button(action: {
                        rubemeraldy = "Sign in"
                        route = .login
                        
                    }) {
                        Text("Login by email")
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
                    .padding(.horizontal,20)
                    .padding(.bottom,20)
                    
                    Button(action: {
                        
                        GlobalLoadingManager.shared.show()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            GlobalLoadingManager.shared.hide()
                            
                            let manger = AppStorageManager.shared;
                            
                            if(manger.getTouristsUserId() != -1){
                                manger.saveCurrentUserId(manger.getTouristsUserId())
                            }else{
                                let newUid = manger.addUser()
                                manger.saveTouristsUserId(newUid)
                                manger.saveCurrentUserId(newUid)
                            }
                        }
                        
                        
                       
                        
                        
                        
                        
                       
                        
                    }) {
                        Text("I'm new")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 14)
                            .background(
                                Color(red: 1, green: 1, blue: 1, opacity: 0.2)
                            )
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
                    }
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                    .padding(.bottom,20)
                    
                    HStack(spacing:0){
                        Text("Don't have an account?")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.7))
                        
                        Text("Sign up")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Color(red: 237/255, green: 55/255, blue: 251/255, opacity: 1))
                            .underline(true, color: Color(red: 237/255, green: 55/255, blue: 251/255))
                    }.padding(.bottom,30)
                        .onTapGesture {
                            rubemeraldy = "Sign up"
                            route = .login
                        }
                    
                    
                    HStack(spacing:3){
                        Button(action: {
                            isChecked.toggle()
                        }) {
                            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                                .foregroundColor(isChecked ? Color(red: 237/255, green: 55/255, blue: 251/255) : Color.white.opacity(0.7))
                                .font(.system(size: 16))
                        }
                        Text("Agree with")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.7))
                        Button {
                            stackingUrl = "https://app.r2f2wgvf.link/users"
                            route = .collarprivacy
                        } label: {
                        Text("User Agreement")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(Color(red: 237/255, green: 55/255, blue: 251/255, opacity: 1))
                            .underline(true, color: Color(red: 237/255, green: 55/255, blue: 251/255))
                        }
                        .buttonStyle(.plain)
                        Text("and")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.7))
                        Button {
                            stackingUrl = "https://app.r2f2wgvf.link/privacy"
                            route = .collarprivacy
                        } label: {
                        Text("Privacy Policy")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(Color(red: 237/255, green: 55/255, blue: 251/255, opacity: 1))
                            .underline(true, color: Color(red: 237/255, green: 55/255, blue: 251/255))
                        }
                        .buttonStyle(.plain)
                    }.padding(.bottom,35)
                    
                }
                
                GlobalLoadingView()
            }.fullScreenCover(item: $route) { route in
                switch route {
                case .login:
                    RootView(iecheadban: rubemeraldy)

                case .register:
                    ForgotView()

                case .collarprivacy:
                    WhimsicalView(stackingUrl:stackingUrl)

                   
                }
            }

    }
}


