//
//  WalletView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/16.
//

import SwiftUI

struct WalletView: View {
    let items = Array(1...20)
        
        // 定义两列网格
        let columns = [
            GridItem(.flexible(), spacing: 13),
            GridItem(.flexible(), spacing: 13)
        ]
    var body: some View {
        ZStack{
            Image("asiudiq_bei")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(alignment: .leading,spacing:0){
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
                .padding(.top,50)
                .padding(.bottom,24)
              
                .frame(maxWidth: .infinity,alignment: .leading)
                
                ZStack {
                    LinearGradient(
                        colors: [
                            Color(red: 236/255, green: 55/255, blue: 250/255),
                            Color(red: 152/255, green: 43/255, blue: 251/255),
                            
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(height: 86)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(15)
                    
                    HStack{
                        VStack{
                            Text("400")
                                .font(.system(size: 30, weight: .black))
                                .foregroundColor(.white)
                            Text("Balance")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white.opacity(0.5))
                            
                        }
                        Spacer()
                        Image("zucbqu_dajin")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 76, height: 76)
                                      
                    }.padding(
                        .horizontal,16
                    )
                }.padding(.bottom,16)
                
                ScrollView {
                           LazyVGrid(columns: columns, spacing: 13) {
                               ForEach(items, id: \.self) { item in
                                   Rectangle()
                                       .fill(   Color(red: 48/255, green: 49/255, blue: 51/255),)
                                       .frame(height: 108)
                                       .overlay(
                                        VStack{
                                            Image("zucbqu_dajin")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            .frame(width: 40, height: 40)
                                                            .padding(.top,5)
                                            
                                            Text("400")
                                                .font(.system(size: 16, weight: .black))
                                                .foregroundColor(Color(red: 237/255, green: 55/255, blue: 251/255),)
                                            
                                            ZStack{
                                                Color(red: 89/255, green: 90/255, blue: 92/255)
                                                        .frame(height: 38)
                                                        .frame(maxWidth: .infinity)
                                                Text("$ 0.99")
                                                    .font(.system(size: 12, weight: .semibold))
                                                    .foregroundColor(Color(red: 1, green: 1, blue: 1),)
                                                
                                            }
                                        }
                                       )
                                       .cornerRadius(15)
                               }
                           }
                           
                }.padding(.bottom,35)
                
                
                
                Spacer()
            }.padding(.horizontal,16)
        }
    }
}

#Preview {
    WalletView()
}
