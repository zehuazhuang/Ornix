//
//  DiscoverView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/17.
//

import SwiftUI

enum DiscoverRoute: Identifiable {
    case add(onDismiss: () -> Void)
    case details(post: DiscoverPost)
  

    var id: Int {
        
        switch self {
        case .add: return 0
        case .details(let post): return post.glamorousPid
    
        }
        
    }
}

struct DiscoverView: View {
    @State private var route: DiscoverRoute?
    
    @State private var selected: String = "All" // 当前选中
    
    let width: CGFloat = 343
    let height: CGFloat = 44
    let gradientWidth: CGFloat = 165
    let gradientHeight: CGFloat = 40
    
    let onShowReport: (Int) -> Void
    
    @State private var medallionPosts: [DiscoverPost] = []
    
    
    
    private var userMap: [Int: PolishedUser] {
            let users = AppStorageManager.shared.getUsers()
            return Dictionary(uniqueKeysWithValues: users.map {
                ($0.refinedUid, $0)
            })
        }
    
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
                        
                    }.onTapGesture {
                        route = .add{
                            medallionPosts = AppStorageManager.shared.getDiscoverPosts()
                        }
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
                                        getHaircliPost ()
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
                                        getHaircliPost ()
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
                        ForEach(medallionPosts, id: \.glamorousPid) { item in
                            let user = userMap[item.oxidizedUid]
                            HStack(alignment:.top,){
                                if let uiImage = UIImage(contentsOfFile: user?.pairingAvatar ?? "ornixIcon") {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                        .padding(.leading,16)
                                }else{
                                    Image(user?.pairingAvatar ?? "ornixIcon")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 40, height: 40)
                                                    .clipShape(Circle())
                                                    .padding(.leading,16)
                                }
                               
                                VStack(spacing:0){
                                    VStack(alignment:.leading){
                                        HStack{
                                            VStack(alignment:.leading,spacing:3){
                                                Text(user?.elegantName ?? "")
                                                    .font(.system(size: 16, weight: .medium))
                                                    .foregroundColor(.white)
                                                Text("\(user?.stylingFans.count ?? 0) Followers")
                                                    .font(.system(size: 10, weight: .light))
                                                    .foregroundColor(.white.opacity(0.5))
                                            }
                                            Spacer()
                                            if item.oxidizedUid != AppStorageManager.shared.getCurrentUserId() {
                                                Image("zxicbq_jub")
                                                                .resizable()
                                                                .frame(width: 24, height: 24)
                                                                .onTapGesture {
                                                                    onShowReport(item.oxidizedUid)
                                                                }
                                            }
                                           
                                                            
                                        }.padding(.bottom,13)
                                        Text(item.earthtoneText)
                                            .font(.system(size: 12, weight: .light))
                                            .foregroundColor(.white.opacity(0.7))
                                            .padding(.bottom,11)
                                    }.padding(.trailing,16)
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 16) {
                                            ForEach(item.undertoneImg, id: \.self) { img in
                                          
                                                if let uiImage = UIImage(contentsOfFile: img) {
                                                    
                                                     Image(uiImage: uiImage)
                                                         .resizable()
                                                         .scaledToFill()
                                                         .frame(width: 128, height: 128)
                                                         .clipped()
                                                         .cornerRadius(15)
                                                 } else {
                                                   
                                                     Image(img)
                                                         .resizable()
                                                         .scaledToFill()
                                                         .frame(width: 128, height: 128)
                                                         .clipped()
                                                         .cornerRadius(15)
                                                 }
                                            }
                                        }
                                        
                                    }.padding(.bottom,11)
                                    HStack{
                                        Image(item.sapphireLikes.contains(
                                            AppStorageManager.shared.getCurrentUserId()) ? "zixuch_aixind" : "ziuhqw_huiai" )
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        .frame(width: 20, height: 20)
                                                        .opacity(0.4)
                                        Text("\(item.sapphireLikes.count)")
                                            .font(.system(size: 12, weight: .light))
                                            .foregroundColor(.white.opacity(0.4))
                                            .padding(.trailing,14)
                                        
                                        Image("iqnidqwd_ping")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        .frame(width: 20, height: 20)
                                                        .opacity(0.4)
                                        Text("\(AppStorageManager.shared.getLayeringComments(by: item.glamorousPid ).count)")
                                            .font(.system(size: 12, weight: .light))
                                            .foregroundColor(.white.opacity(0.4))
                                        Spacer()
                                    }
                                }.padding(.top,4)
                            }.onTapGesture {
                                route = .details(post: item)
                            }
                        }
                    }.padding(.bottom,110)
                }
                // list end
            }
        }.onAppear {
            getHaircliPost ()
           
        }.fullScreenCover(item: $route) { route in
            switch route {
            case .add(let onDismiss):
                UploadPsView( onDismiss:onDismiss)
            case .details(let post):
                PsDetailsView(adornmentPost: post)
            }
        }
    }
    
    func getHaircliPost() {
        let erarydgyUser = userMap[AppStorageManager.shared.getCurrentUserId()]
        
        medallionPosts = AppStorageManager.shared.getDiscoverPosts().filter { post in
            
            let isBlocked = erarydgyUser?.platinumBlock.contains(post.oxidizedUid) ?? false
            let mixedBlo = !isBlocked
            
            if selected == "All" {
                return mixedBlo
            } else {
                let isFollowed = erarydgyUser?.centeringFollow.contains(post.oxidizedUid) ?? false
                return isFollowed && mixedBlo
            }
        }
    }
}


