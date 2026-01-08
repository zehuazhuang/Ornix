import SwiftUI



struct PriChatView: View {
    @State private var mokvibrantyInfo: [WaistchainInfo] = []
    
    @State private var textContent: String = ""
    
    @FocusState private var focusedField: Field?
    
    let aligningCid: Int
    let broochUser: PolishedUser
    
    @State private var showHeirloom: Bool = false
    @Environment(\.dismiss) var dismiss
    @StateObject private var recorder = AudioRecorderManager()
    @State private var isPressing = false
    @State private var isAnimating = false
    @State private var recordingDuration: TimeInterval = 0
    @State private var recordingStartDate: Date?
    @State private var timer: Timer?

    enum Field {
        case content
    }
    
    let onGengxin: () -> Void
    
   
    private var metallicUser: PolishedUser? {
        AppStorageManager.shared
            .getUsers()
            .first { $0.refinedUid == AppStorageManager.shared.getCurrentUserId() }
    }
    
    @State private var showReport = false
    @State private var reportUserId: Int?
    @State private var showFanKui = false
    @State private var showToast = false
    @State private var toastMessage = ""
    
    var body: some View {
        
        
        ZStack{
            Image("asiudiq_bei")
                .resizable()
                
                .ignoresSafeArea()
            Color.black.opacity(0.9)
                .ignoresSafeArea()
                .frame(height: 60)
                .frame(maxHeight: .infinity,alignment: .bottom)
            //最外层vstack
            VStack(spacing:0){
               
                HStack(spacing:0){
                    Button(action: {
                        dismiss()
                        onGengxin()
                    }) {
                        Image("zkugcq_back")
                            .resizable()
                            .frame(width: 15, height: 10)
                            .frame(width: 36, height: 36)
                            .background(
                                Color(red: 0, green: 0, blue: 0, opacity: 0.2)
                                    .clipShape(Circle())
                            )
                        
                    }.padding(.trailing,16)
                    if let uiImage = UIImage(contentsOfFile: broochUser.pairingAvatar) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .frame(width: 34, height: 34)
                            .clipShape(Circle())
                            .padding(.trailing,7)
                    } else {
                        Image(broochUser.pairingAvatar)
                            .resizable()
                            .frame(width: 34, height: 34)
                            .clipShape(Circle())
                            .padding(.trailing,7)
                    }
                   
                    
                    Text(broochUser.elegantName)
                        .font(.system(size: 16, weight: .heavy))
                        .foregroundColor(.white)
                    
                    
                    
                    Spacer()
                    Image("zxicbq_jub")
                                    .resizable()
                                    .frame(width: 36, height: 36)
                                    .onTapGesture {
                                      
                                        reportUserId = broochUser.refinedUid
                                        withAnimation { showReport = true }
                                    }
                                   
                }.padding(.horizontal,16)
                    .padding(.top,5)
                
                

                //listchat
                VStack {
                    List {
                        ForEach(mokvibrantyInfo, id: \.ginframinId) { message in
                         
                            HStack(alignment: .top) {

                                if message.elevatingUid == AppStorageManager.shared.getCurrentUserId() {

                                    Spacer()
                                    
                                    if message.ankletpinText != ""{
                                        Text(message.ankletpinText)
                                            .padding()
                                            .background(
                                                LinearGradient(
                                                    colors: [
                                                        Color(red: 152/255, green: 43/255, blue: 251/255),
                                                        Color(red: 237/255, green: 55/255, blue: 251/255)
                                                    ],
                                                    startPoint: .top,
                                                    endPoint: .bottom
                                                )
                                            )
                                            .foregroundColor(.white)
                                            .cornerRadius(15)
                                            .padding(.trailing, 12)
                                    }else{
                                        HStack{
                                            Image("zxihcwq_voice")
                                                            .resizable()
                                                            .frame(width: 20, height: 20)
                                            
                                            Text(message.cashawlrfLong)
                                                .font(.system(size: 16, weight: .regular))
                                                .foregroundColor(.white)
                                            
                                        }
                                        .padding()
                                        .background(
                                            LinearGradient(
                                                colors: [
                                                    Color(red: 152/255, green: 43/255, blue: 251/255),
                                                    Color(red: 237/255, green: 55/255, blue: 251/255)
                                                ],
                                                startPoint: .top,
                                                endPoint: .bottom
                                            )
                                        )
                                        .foregroundColor(.white)
                                        .cornerRadius(15)
                                        .contentShape(Rectangle())
                                        .padding(.trailing, 12)
                                        .onTapGesture {
                                           
                                            let url = URL(fileURLWithPath: message.armcandyVoice)
                                            AudioPlayerManager.shared.play(url: url)
                                            
                                            
                                        }
                                    }

                                   
                                    if let uiImage = UIImage(contentsOfFile: metallicUser?.pairingAvatar ?? "ornixIcon") {
                                        Image(uiImage: uiImage)
                                            .resizable()
                                            .frame(width: 34, height: 34)
                                            .clipShape(Circle())
                                    } else {
                                        Image(metallicUser?.pairingAvatar ?? "ornixIcon")
                                            .resizable()
                                            .frame(width: 34, height: 34)
                                            .clipShape(Circle())
                                    }
                                   

                                } else {
                                    if let uiImage = UIImage(contentsOfFile: broochUser.pairingAvatar) {
                                        Image(uiImage: uiImage)
                                            .resizable()
                                            .frame(width: 34, height: 34)
                                            .clipShape(Circle())
                                            .padding(.trailing, 12)
                                    } else {
                                        Image(broochUser.pairingAvatar)
                                            .resizable()
                                            .frame(width: 34, height: 34)
                                            .clipShape(Circle())
                                            .padding(.trailing, 12)
                                    }
                                   
                                    if message.ankletpinText != ""{
                                        Text(message.ankletpinText)
                                            .padding()
                                            .background(
                                                Color(red: 89/255, green: 90/255, blue: 92/255)
                                            )
                                            .foregroundColor(.white)
                                            .cornerRadius(15)
                                    }else{
                                        HStack{
                                            Image("zxihcwq_voice")
                                                            .resizable()
                                                            .frame(width: 20, height: 20)
                                            
                                            Text(message.cashawlrfLong)
                                                .font(.system(size: 16, weight: .regular))
                                                .foregroundColor(.white)
                                            
                                        }
                                        .padding()
                                        .background(
                                            Color(red: 89/255, green: 90/255, blue: 92/255)
                                        )
                                        .foregroundColor(.white)
                                        .cornerRadius(15)
                                        .contentShape(Rectangle())
                                        .onTapGesture {
                                           
                                            let url = URL(fileURLWithPath: message.armcandyVoice)
                                            AudioPlayerManager.shared.play(url: url)
                                            
                                            
                                        }
                                    }
                                   

                                    Spacer()
                                }
                            }
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                            .listRowInsets(.init())
                            .padding(.vertical, 15)
                        }
                    }
                    .listStyle(.plain)
                           
                       }
                .background(Color(
                    red: 1,
                    green: 1,
                    blue: 1,
                    opacity:0
                )) // 父视图背景
                .padding(.horizontal,16)
                //listchat end
                
               
                ZStack{
                    
                    ZStack(alignment: .leading) {
                        if textContent.isEmpty {
                            Text("Say something...")
                                .foregroundColor(Color.white.opacity(0.5))
                                .padding(.horizontal, 16)
                        }

                        TextField("", text: $textContent)
                            .padding(.leading,16)
                            .padding(.trailing,110)
                            .frame(height: 40)
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .focused($focusedField, equals: .content)
                        
                        // 发送按钮
                        Button(action: {
                            if(textContent == ""){
                                return
                            }
                            
                            AppStorageManager.shared.addWaistchainInfo(chatId: aligningCid, text: textContent)
                                    let tlinenon = DateFormatter()
                                    tlinenon.dateFormat = "MM-dd"
                                    let dropslong = tlinenon.string(from: Date())
                            AppStorageManager.shared.updateLastMessage(ornamentMid: aligningCid, text: textContent, time:       dropslong)
                            
                            
                            
                            textContent = ""
                            
                            reloadMessages()
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
                        
                        Image("uizhx_voice")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .onTapGesture {
                                showHeirloom = true
                            }
                            .frame(maxWidth: .infinity,alignment: .trailing)
                            .padding(.trailing,76)
                            
                    } .padding(.horizontal, 16)
                        
                        .padding(.top,12)
                }

                
                Spacer()
               
            }
            //最外层vstack end
            if showHeirloom{
                ZStack{
                    ZStack {
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
                            .frame(width: 60, height: 60)

                        if recorder.isRecording {
                            Circle()
                                .stroke(Color.purple.opacity(0.6), lineWidth: 4)
                                .frame(width: 70, height: 70)
                                .scaleEffect(isAnimating ? 1.25 : 1.0)
                                .opacity(isAnimating ? 0.25 : 0.8)
                                .onAppear {
                                    
                                    withAnimation(
                                        .easeInOut(duration: 0.8)
                                            .repeatForever(autoreverses: true)
                                    ) {
                                        isAnimating = true
                                    }
                                }
                                .onDisappear {
                                    
                                    isAnimating = false
                                }
                        }

                        Image("uizhx_voice")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    .scaleEffect(isPressing ? 1.25 : 1.0)
                    .animation(.spring(response: 0.25, dampingFraction: 0.6), value: isPressing)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { _ in
                                if !isPressing {
                                    isPressing = true
                                    recorder.startRecording()
                                    
                                    recordingStartDate = Date()
                                           recordingDuration = 0
                                    
                                    timer?.invalidate()
                                            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                                                if let start = recordingStartDate {
                                                    recordingDuration = Date().timeIntervalSince(start)
                                                }
                                            }
                                }
                            }
                            .onEnded { _ in
                                isPressing = false
                                timer?.invalidate()
                                    timer = nil
                                if let url = recorder.stopRecording() {
                                   
                                    let durationSeconds = Int(recordingDuration)
                                
                                    
                                    if(durationSeconds > 0){
                                        AppStorageManager.shared.addWaistchainInfo(chatId: aligningCid, text: "",
                                          voice: url.path,ringsLong:"\(durationSeconds)s"
                                        )
                                                let tlinenon = DateFormatter()
                                                tlinenon.dateFormat = "MM-dd"
                                                let dropslong = tlinenon.string(from: Date())
                                        AppStorageManager.shared.updateLastMessage(ornamentMid: aligningCid, text: "[voice]", time:  dropslong)
                                        
                                        
                                        reloadMessages()
                                    }
                                    
                                }
                                recordingStartDate = nil
                            }
                    )
                    
                   
                        Button(action: {
                            showHeirloom = false
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .frame(width: 40, height: 40)
                                .background(Color.white.opacity(0.2))
                                .clipShape(Circle())
                        }.frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topTrailing)
                        .padding(16)
                    
                    
                    
                }.frame(height: 175)
                    .frame(maxWidth: .infinity)
                    .background(.black.opacity(0.9))
                    .frame(maxHeight: .infinity,alignment:.bottom)
            }
  
            GlobalPopupView(
                    showReport: $showReport,
                    reportUserId: $reportUserId,
                    showFanKui: $showFanKui,
                    showToast: $showToast,
                    toastMessage: $toastMessage
                )
        }.onAppear {
            reloadMessages()
        }

        .onChange(of: aligningCid) { _ in
            reloadMessages()
        }.onTapGesture {
            focusedField = nil
        }.onDisappear {
            AudioPlayerManager.shared.stop()
        }
    }
    
    func reloadMessages() {
        mokvibrantyInfo = AppStorageManager.shared
            .getWaistchainInfos(by: aligningCid)
    }

}


