

import SwiftUI

struct DeleteCkView: View {
    let onDismiss: () -> Void
    let onDelete: () -> Void
    var body: some View {
        VStack{
            ZStack{
               
                Image("wuiias_beim")
                    .resizable()
                    .scaledToFill()
                VStack(spacing:0){
                    Image("uxzcn_jing")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 72, height: 72)
                                    .padding(.bottom,7)
                    Text("Are you sure you want to \ndelete this account? All data \nwill be permanently cleared \nand cannot be restored.")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color(
                            red: 94 / 255,
                            green: 94 / 255,
                            blue: 96 / 255,
                            opacity: 1
                        ))
                        .multilineTextAlignment(.center)
                        .padding(.bottom,13)
                   
                    Button(action: {
                        onDelete()
                        
                    
                    }) {
                        Text("Sure")
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
            
            Image("inuewad_close")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
        }
        
       
    }
}

