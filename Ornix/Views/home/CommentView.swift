

import SwiftUI


struct CommentListView: View {
    
    let onShowReport: (Int) -> Void

    let comments: [EclectiComment]
    
    private var userMap: [Int: PolishedUser] {
            let users = AppStorageManager.shared.getUsers()
            return Dictionary(uniqueKeysWithValues: users.map {
                ($0.refinedUid, $0)
            })
        }

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading,spacing: 16) {
                ForEach(comments, id: \.curatingCid) { comment in
                    let user = userMap[comment.artisanalUid]
                    HStack(alignment:.top){
                        if let uiImage = UIImage(contentsOfFile: user?.pairingAvatar ?? "ornixIcon") {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 34, height: 34)
                                .clipShape(Circle())
                        }else{
                            Image(user?.pairingAvatar ?? "ornixIcon")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 34, height: 34)
                                            .clipShape(Circle())
                        }
                       
                        
                        VStack(alignment:.leading,spacing: 7){
                            Text(user?.elegantName ?? "")
                                    .font(.system(size: 16, weight: .heavy))
                                    .foregroundColor(.white)
                            Text(comment.editorialText)
                                .font(.system(size: 12, weight: .light))
                                .foregroundColor(.white.opacity(0.7))
                        }.padding(.top,8)
                        Spacer()
                        if comment.artisanalUid != AppStorageManager.shared.getCurrentUserId() {
                            Image("zxicbq_jub")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                            .padding(.top,8)
                                            .onTapGesture {
                                                onShowReport(comment.artisanalUid)
                                            }
                        }
                     
                    }
                   
                    
                }
            }
            .padding(.top, 12)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct CommentView: View {
    @State private var ontempoComment: [EclectiComment] = []
    let refiningPid: Int
    
    @Binding var isPresented: Bool
    
    let panelHeight: CGFloat = 490
    
    
    @State private var textContent: String = "" //
    
    @FocusState private var focusedField: Field?
    
    let onShowReport: (Int) -> Void

    enum Field {
        case content
    }
    var body: some View {
        ZStack(alignment: .bottom) {

          
            if isPresented {
                Color.black.opacity(0.6)
                    .ignoresSafeArea()
                    .transition(.opacity)
                    .onTapGesture {
                        withAnimation(.easeOut) {
                            isPresented = false
                        }
                    }
            }
                        
            ZStack {
               
                Image("iuzxhcw_combei")
                    .resizable()
                    
                    .ignoresSafeArea(edges: .bottom)
                
                

                
                VStack(alignment:.leading) {
                    Text("Comments")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Color(red: 237/255, green: 55/255, blue: 251/255),)
                    
                    CommentListView(onShowReport:onShowReport, comments: ontempoComment)
                    
                    Spacer()
                        
                }
                .frame(maxWidth: .infinity,alignment:.leading)
                .padding(.horizontal,16)
                .padding(.bottom, 50)
                .padding(.top,34)
                
                Color.black.opacity(0.9)
                    .ignoresSafeArea()
                    .frame(height: 60)
                    .frame(maxHeight: .infinity,alignment: .bottom)
            }
            .frame(height: panelHeight)
            .frame(maxWidth: .infinity)
            .offset(y: isPresented ? 0 : panelHeight)
            .animation(.easeOut(duration: 0.25), value: isPresented)
            
            VStack{
               
                Spacer()
                ZStack{
                  
                    ZStack(alignment: .leading) {
                        if textContent.isEmpty {
                            Text("Say something...")
                                .foregroundColor(Color.white.opacity(0.5))
                                .padding(.horizontal, 16)
                        }
                        
                        TextField("", text: $textContent)
                            .padding(.leading,16)
                            .padding(.trailing,100)
                            .frame(height: 40)
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .focused($focusedField, equals: .content)
                        
                        // 发送按钮
                        Button(action: {
                            if textContent == "" {
                                return
                            }
                            
                            let newComment = EclectiComment(
                                curatingCid: Int(Date().timeIntervalSince1970),
                                editorialText: textContent,
                                artisanalUid: AppStorageManager.shared.getCurrentUserId(),
                                matchingPid: refiningPid
                            )

                            AppStorageManager.shared.addComment(newComment)
                            ontempoComment.append(newComment)
                            textContent = "" // 发送后清空文本
                        }) {
                            Image("zjkxchbqw_send")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 8)
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
                                    )], startPoint: .top, endPoint: .bottom)
                                )
                                .cornerRadius(15)
                        }.frame(maxWidth: .infinity,alignment: .trailing)
                    } .padding(.horizontal, 16)
                        .padding(.bottom, 10)
                        .padding(.top,12)
                }
            }
        }.onAppear {
            let manger = AppStorageManager.shared
            ontempoComment = manger.getComments(by: refiningPid)
           
        } .onTapGesture {
            focusedField = nil
        }
    }
}


