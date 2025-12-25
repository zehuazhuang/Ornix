//
//  FanKuiView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/17.
//

import SwiftUI


struct FanKuiView: View {
    @State private var items: [String] = [
           "Privacy leakage",
           "Unlawful remarks",
           "Violent and bloody",
           "Discrimination and abuse",
           "Malicious harassment",
           "Infringement and theft",
           "Others",
       ]
    @State private var entingText = ""

    
    let onDismiss: () -> Void
    var body: some View {
        ZStack{
            Image("zkjbq_damengb")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(edges: .bottom)
            
            VStack(spacing: 12) {
                            ForEach(items, id: \.self) { item in
                                Button(action: {
                                    entingText = item
                                }) {
                                    Text(item)
                                        .font(.system(size: 16, weight: .light))
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity, minHeight: 40)
                                        .background(
                                            entingText == item ? Color(red: 237/255, green: 55/255, blue: 251/255) :      .white.opacity(0.2)
                                        )
                                        .cornerRadius(15)
                                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                                }
                            }
                
                
                Button(action: {
                    if(entingText == ""){
                        return
                    }
                    
                    GlobalLoadingManager.shared.show()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        GlobalLoadingManager.shared.hide()
                        
                        
                           
                      
                            onDismiss()
                       
                      
                    }
                    
                    
                }) {
                    Text("Submit")
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
                .padding(.top,6)
                
                
                Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top, 26)
                        .padding(.bottom,26)
            
            GlobalLoadingView()

            
        }.frame(height: 536)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea(edges: .bottom)
                
    }
}


