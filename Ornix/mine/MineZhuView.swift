//
//  MineZhuView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/17.
//

import SwiftUI
import WaterfallGrid

struct MineZhuView: View {
    let heights: [CGFloat] = (0..<30).map { _ in
        CGFloat.random(in: 120...260)
    }
    
    let items = Array(0..<30)
    var body: some View {
        ZStack{
            Image("asiudiq_bei")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack(spacing:0){
                HStack{
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
                    Spacer()
                    Image("zxicbq_jub")
                                    .resizable()
                                    .frame(width: 36, height: 36)
                                   
                }.padding(.horizontal,16)
                    .padding(.top,55)
                    .padding(.bottom,20)
                // 滑 start
                ScrollView{
                    VStack(spacing:0){
                        Image("ornixIcon")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 115, height: 115)
                                        .clipShape(Circle())
                                        .padding(.bottom,16)
                        Text("Yoolgeun")
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(.white)
                            .padding(.bottom,22)
                        
                        HStack{
                            Spacer()
                            VStack(spacing:4){
                                Text("12")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                Text("Posts")
                                    .font(.system(size: 10, weight: .light))
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            Spacer()
                            VStack(spacing:4){
                                Text("864")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                Text("Following")
                                    .font(.system(size: 10, weight: .light))
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            Spacer()
                            VStack(spacing:4){
                                Text("255")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                Text("Followers")
                                    .font(.system(size: 10, weight: .light))
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            Spacer()
                        }.padding(.bottom,24)
                        
                        HStack(spacing:15){
                            Button(action:{}){
                                Text("Follow")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                            }.frame(width: 125,height: 46)
                                .background( Color(red: 237/255, green:55/255, blue: 251/255),)
                                .cornerRadius(15)
                            Button(action:{}){
                                Text("Message")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                            }.frame(width: 125,height: 46)
                                .background( Color(red: 48/255, green:49/255, blue: 51/255),)
                                .cornerRadius(15)
                        }.padding(.bottom,24)
                        
                        HStack{
                            Text("Posts")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                            Spacer()
                        }.padding(.horizontal,16)
                            
                        
                        WaterfallGrid(items, id: \.self) { index in
                            Group {
                              
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
                        .gridStyle(columns: 2, spacing: 13, )
                        .padding()
                            
                            
                    }
                }
                // 滑 end
            }
        }
    }
}

#Preview {
    MineZhuView()
}
