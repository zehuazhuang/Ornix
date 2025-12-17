//
//  ReportView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/17.
//

import SwiftUI

struct ReportView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
                    Image("iqwnds_botbei")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea(edges: .bottom)
            
            VStack{
                Button(action: {}) {
                    Text("Block")
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
                .padding(.top,40)
               
                Button(action: {}) {
                    Text("Report")
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
                
                
                
                Spacer()
            }
                        
                }.frame(height: 200)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ReportView()
}
