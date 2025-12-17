//
//  YubuZuView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/16.
//

import SwiftUI

struct YubuZuView: View {
    var body: some View {
        ZStack{
            Color.black.frame(width: 285, height: 245)
            Image("wuiias_beim")
                .resizable()
                .scaledToFill()
            
            VStack(spacing:0){
                
                Image("zucbqu_dajin")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 72, height: 72)
                                .padding(.bottom,7)
                
                Text("Your account balance is \ninsufficient. Please recharge \nand try again.")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color(
                        red: 94 / 255,
                        green: 94 / 255,
                        blue: 96 / 255,
                        opacity: 1
                    ))
                    .multilineTextAlignment(.center)
                    .padding(.bottom,26)
                
                Button(action: {}) {
                    Text("Recharge")
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
                .frame(maxWidth: 235, minHeight: 50)
                .padding(.bottom,15)
               
                               
            }
               
        }.frame(width: 285,height: 245)
    }
}

#Preview {
    YubuZuView()
}
