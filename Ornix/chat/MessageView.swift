//
//  MessageView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/17.
//

import SwiftUI

struct MessageView: View {
    var body: some View {
        ZStack{
            Image("asiudiq_bei")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    Text("Chat")
                        .font(.system(size: 38, weight: .black))
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [
                                            Color(red: 152/255, green: 43/255, blue: 251/255),
                                            Color(red: 236/255, green: 55/255, blue: 250/255)
                                        ],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                    Spacer()
                }.padding(.top,55)
                    .padding(.horizontal,16)
                ScrollView{
                    ForEach(0..<2) {index in
                        HStack(spacing:12){
                            Image("ornixIcon")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 60, height: 60)
                                            .clipShape(Circle())
                            
                            HStack{
                                VStack(alignment:.leading,spacing:5){
                                    Text("Yoolgeun")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.white)
                                    Text("Hello. Nice to meet you")
                                        .font(.system(size: 12, weight: .regular))
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                Spacer()
                                Text("2 Mins ago")
                                    .font(.system(size: 10, weight: .medium))
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical,10)
                             .padding(.horizontal,12)
                                .background(
                                    .white.opacity(0.1)
                                )
                                .cornerRadius(15)
                            
                        }.padding(.bottom,12)
                    }
                }.padding(.horizontal,16)
            }
        }
    }
}

#Preview {
    MessageView()
}
