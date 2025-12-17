//
//  OrnixHomeView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/16.
//

import SwiftUI
import WaterfallGrid

struct OrnixHomeView: View {
    let items = Array(0..<30)

        // 🔒 高度缓存（关键）
        let heights: [CGFloat] = (0..<30).map { _ in
            CGFloat.random(in: 120...260)
        }
    var body: some View {
        ZStack{
            Image("asiudiq_bei")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment:.leading,spacing: 0){
                    HStack{
                        Text("Ornix")
                                    .font(.system(size: 38, weight: .bold))
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
                        Image("ornixIcon")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                        
                    }.padding(.horizontal,20)
                     .padding(.top,50)
                    
                    ZStack{
                        Image("zxcwiqu_gribei")
                            .resizable()
                            .scaledToFill()
                        
                        VStack(alignment:.leading){
                            Text("Ornix AI")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                            Text("Don't know how to make your \naccessory combinations stand out? \nLeave it to the AI assistant to handle.")
                                .font(.system(size: 10, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.bottom,14)
                            Image("iuqwhd_go")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 143, height: 36)
                            Spacer()
                        }.frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading,13)
                            .padding(.top,13)
                        
                        Button(action: {}) {
                            HStack(spacing:0){
                                
                                Image("zxnciuq_coin")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 20, height: 20)
                                               
                                Text("-300")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(Color(
                                        red: 25 / 255,
                                        green: 26 / 255,
                                        blue: 28 / 255,
                                        opacity: 1
                                    ))
                            }
                                                .frame(width:68,height: 28)
                                                .background(
                                                    LinearGradient(colors: [ Color(
                                                        red: 255 / 255,
                                                        green: 235 / 255,
                                                        blue: 59 / 255,
                                                        opacity: 1
                                                    ),
                                                                             Color(
                                                                                 red: 255 / 255,
                                                                                 green: 141 / 255,
                                                                                 blue: 26 / 255,
                                                                                 opacity: 1
                                                                             )], startPoint: .top, endPoint: .bottom)
                                                )
                                                .cornerRadius(100)
                                               
                                        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                            

                      
                                        
                        
                        
                    }.frame(width: 343,height: 156)
                        .frame(maxWidth: .infinity)
                                .padding(.top, 20)
                    
                    
                }.padding(.bottom,20)
                //ai stack
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 13) {
                        ForEach(0..<5, id: \.self) { index in
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(
                                    red: 1,
                                    green: 1,
                                    blue: 1,
                                    opacity: 0.1
                                ))
                                
                                .frame(width: 136, height: 168)
                                .overlay(
                                    ZStack{
                                        VStack(alignment:.leading, spacing:0){
                                            Image("ornixIcon")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            .frame(width: 60, height: 60)
                                                            .clipShape(Circle())
                                                            .padding(.bottom,6)
                                            Text("Yoolgeun")
                                                .font(.system(size: 16, weight: .bold))
                                                .foregroundColor(.white)
                                                .padding(.bottom,3)
                                            Text("259 Followers")
                                                .font(.system(size: 10, weight: .semibold))
                                                .foregroundColor(Color(
                                                    red: 1,
                                                    green: 1,
                                                    blue: 1,
                                                    opacity: 0.5
                                                )).padding(.bottom,11)
                                            Button(action:{}) {
                                                Text("+ Follow")
                                                    .font(.system(size: 12, weight: .semibold))
                                                    .frame(width: 76, height: 27)
                                                            .background( Color(red: 237/255, green: 55/255, blue: 251/255),)
                                                            .foregroundColor(.white)
                                                            .cornerRadius(20)
                                                        }
                                            Spacer()
                                            
                                            
                                            
                                        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                            .padding(.top,13)
                                            .padding(.leading,13)
                                        
                                        
                                        Image("zxicbq_jub")
                                                        .resizable()
                                                        .frame(width: 24, height: 24)
                                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                                        .padding(.top,9)
                                                        .padding(.trailing,9)
                                                        
                                        
                                    }
                                )
                        }
                    }
                    .padding(.horizontal)
                }.padding(.bottom,10)
                //ai stack
                
                Text("Recommended")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding(.leading,20)
                  
                //瀑布流
                ScrollView {
                    WaterfallGrid(items, id: \.self) { index in
                        Group {
                            if index == 0 {
                                
                                Image("zkxjbcu_gofa")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 106)
                                    .frame(maxWidth: .infinity)
                                   
                                               
                               
                            } else {
                                GeometryReader { geo in
                                    ZStack{
                                        Image("ornixIcon")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: geo.size.width, height: heights[index])
                                            .clipShape(RoundedRectangle(cornerRadius: 15))
                                            .clipped()
                                        
                                        HStack{
                                            HStack {
                                                Image("zixuch_aixin")
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                .frame(width: 16, height: 14)
                                                Text("375")
                                                    .font(.system(size: 12, weight: .light))
                                                    .foregroundColor(.white)
                                            }
                                            .frame(width: 58, height: 24)
                                            .background(
                                                RoundedRectangle(cornerRadius: 100)
                                                    .fill(Color(
                                                        red: 0,
                                                        green: 0,
                                                        blue: 0,
                                                        opacity: 0.2
                                                    ))
                                            )
                                            .foregroundColor(.white)
                                            
                                            Spacer()
                                            Image("zxicbq_jub")
                                                            .resizable()
                                                            .frame(width: 24, height: 24)
                                        }.padding(.horizontal,10)
                                         .padding(.vertical,10)
                                         .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                                        
                                    }
                                    }
                                    .frame(height: heights[index])
                            }
                        }
                    }
                    .gridStyle(columns: 2, spacing: 13, )
                    .padding()
                }
                //瀑布流end
                
            }
        }
    }
}

#Preview {
    OrnixHomeView()
}


