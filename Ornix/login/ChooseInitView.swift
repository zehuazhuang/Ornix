//
//  ChooseInitView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/16.
//

import SwiftUI

struct ChooseInitView: View {
    @State private var isChecked: Bool = false
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
                Text("Ornix")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.bottom,60)
                Button(action: {}) {
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
                
                Button(action: {}) {
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
                    
                    Text("User Agreement")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Color(red: 237/255, green: 55/255, blue: 251/255, opacity: 1))
                        .underline(true, color: Color(red: 237/255, green: 55/255, blue: 251/255))
                    
                    Text("and")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.7))
                    
                    Text("Privacy Policy")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Color(red: 237/255, green: 55/255, blue: 251/255, opacity: 1))
                        .underline(true, color: Color(red: 237/255, green: 55/255, blue: 251/255))
                }.padding(.bottom,35)
               
            }
        }
    }
}

#Preview {
    ChooseInitView()
}
