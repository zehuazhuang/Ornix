//
//  EditInfoView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/17.
//

import SwiftUI

struct EditInfoView: View {
    @State private var textName: String = "" //
    @FocusState private var focusedField: Field?

    enum Field {
        case name
    
    }
    var body: some View {
        ZStack(alignment: .bottom) {
                    Image("iuzxhcw_combei")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea(edges: .bottom)
            
            VStack(spacing:0){
                ZStack(alignment:.bottomTrailing){
                    Image("ornixIcon")
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                    
                    Image("zixuch_ji")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 34,height: 34)
                    
                    
                    
                }.frame(width: 115,height: 115)
                    .padding(.top,40)
                    .padding(.bottom,43)
                
               
                HStack{
                    Text("Username:")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                    Spacer()
                }.padding(.bottom,12)
                ZStack(alignment: .leading) {
                            if textName.isEmpty {
                                Text("Enter your username")
                                    .foregroundColor(Color.white.opacity(0.5))
                                    .padding(.horizontal, 16)
                            }

                            TextField("", text: $textName)
                                .padding(.horizontal, 16)
                                .frame(height: 48)
                                .frame(maxWidth: .infinity)
                                .background(Color.white.opacity(0.1))
                                .cornerRadius(15)
                                .foregroundColor(.white)
                                .focused($focusedField, equals: .name)
                }.padding(.bottom,24)
                
                Spacer()
                Button(action: {}) {
                                    Text("Save")
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
                                            )], startPoint: .leading, endPoint: .trailing)
                                        )
                                        .cornerRadius(15)
                                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
                }.padding(.bottom,35)
                    
            }.padding(.horizontal,16)
        
    }.frame(height: 490)
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    EditInfoView()
}
