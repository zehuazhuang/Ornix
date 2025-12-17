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
    var body: some View {
        ZStack{
            Image("zkjbq_damengb")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(edges: .bottom)
            
            VStack(spacing: 12) {
                            ForEach(items, id: \.self) { item in
                                Text(item)
                                    .font(.system(size: 16, weight: .light))
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity, minHeight: 40)
                                    .background(
                                        Color(red: 1, green: 1, blue: 1).opacity(0.2)
                                    )
                                    .cornerRadius(15)
                                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                            }
                
                
                Button(action: {}) {
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
                .padding(.top,14)
                
                
                Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top, 34)
                        .padding(.bottom,26)
            
           
           
            
            
            
            
        }.frame(height: 520)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    FanKuiView()
}
