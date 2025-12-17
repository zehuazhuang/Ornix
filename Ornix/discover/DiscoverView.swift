//
//  DiscoverView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/17.
//

import SwiftUI

struct DiscoverView: View {
    
    @State private var selected: String = "All" // 当前选中
    
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
            
            VStack(spacing:0){
                HStack{
                    Text("Discover")
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
                    ZStack{
                        Circle()
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            Color(red: 152/255, green: 43/255, blue: 251/255),
                                            Color(red: 237/255, green: 55/255, blue: 251/255),
                                        ],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .frame(width: 40, height: 40)

                          
                            Image("uiqowni_add")
                                .resizable()
                                .frame(width: 16, height: 16)
                        
                    }
                                    
                }.padding(.horizontal,20)
                 .padding(.top,50)
                 .padding(.bottom,23)
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
                                .offset(x: selected == "All" ? -(width/2 - gradientWidth/2) : (width/2 - gradientWidth/2))
                                .animation(.easeInOut(duration: 0.3), value: selected)
                            
                           
                            HStack {
                                Button(action: {
                                    withAnimation {
                                        selected = "All"
                                    }
                                }) {
                                    Text("All")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.white)
                                        .frame(width: gradientWidth, height: height)
                                }
                                
                                Button(action: {
                                    withAnimation {
                                        selected = "Follow"
                                    }
                                }) {
                                    Text("Follow")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.white)
                                        .frame(width: gradientWidth, height: height)
                                }
                            }
                            .frame(width: width, height: height)
                }.padding(.bottom,24)
                
                // list
                ScrollView{
                    VStack(spacing: 24){
                        ForEach(["","","",""], id: \.self) { item in
                            HStack(alignment:.top,){
                                Image("ornixIcon")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 40, height: 40)
                                                .clipShape(Circle())
                                                .padding(.leading,16)
                                VStack(spacing:0){
                                    VStack{
                                        HStack{
                                            VStack(spacing:3){
                                                Text("Yoolgeun")
                                                    .font(.system(size: 16, weight: .medium))
                                                    .foregroundColor(.white)
                                                Text("259 Followers")
                                                    .font(.system(size: 10, weight: .light))
                                                    .foregroundColor(.white.opacity(0.5))
                                            }
                                            Spacer()
                                            Image("zxicbq_jub")
                                                            .resizable()
                                                            .frame(width: 24, height: 24)
                                                            
                                        }.padding(.bottom,13)
                                        Text("A thin silver chain and a plain ring, no need to worry about matching, can instantly add a sense of detail to a simple outfit.")
                                            .font(.system(size: 12, weight: .light))
                                            .foregroundColor(.white.opacity(0.7))
                                            .padding(.bottom,11)
                                    }.padding(.trailing,16)
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 16) {
                                            ForEach(0..<3) { index in
                                                Image("ornixIcon")
                                                                .resizable()
                                                                .scaledToFill()
                                                                .frame(width: 128, height: 128)
                                                                .cornerRadius(15)
                                                                
                                            }
                                        }
                                        
                                    }.padding(.bottom,11)
                                    HStack{
                                        Image("zixuch_aixin")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        .frame(width: 20, height: 20)
                                                        .opacity(0.4)
                                        Text("895")
                                            .font(.system(size: 12, weight: .light))
                                            .foregroundColor(.white.opacity(0.4))
                                            .padding(.trailing,14)
                                        
                                        Image("iqnidqwd_ping")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        .frame(width: 20, height: 20)
                                                        .opacity(0.4)
                                        Text("321")
                                            .font(.system(size: 12, weight: .light))
                                            .foregroundColor(.white.opacity(0.4))
                                        Spacer()
                                    }
                                }.padding(.top,4)
                            }
                        }
                    }.padding(.bottom,35)
                }
                // list end
            }
        }
    }
}

#Preview {
    DiscoverView()
}
