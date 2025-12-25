import SwiftUI


struct NavBarView: View {
    @State private var selectedTab: Tab = .home
    
    @State private var showReport = false
    @State private var reportUserId: Int?
    @State private var showFanKui = false
    @State private var showToast = false
    @State private var toastMessage = ""
    
    private func showReportForUser(_ uid: Int) {
           reportUserId = uid
           withAnimation {
               showReport = true
           }
       }

    enum Tab {
        case home, discover, chat, profile
    }
    
    

    var body: some View {
        ZStack {
            
            Group {
                switch selectedTab {
                case .home:
                    OrnixHomeView { uid in
                        showReportForUser(uid)
                    }
                case .discover:
                    DiscoverView{ uid in
                        showReportForUser(uid)
                    }
                case .chat:
                    MessageView()
                case .profile:
                    MineZhuView(vintageUid: AppStorageManager.shared.getCurrentUserId(), romanticIs: true)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
           
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    navButton(tab: .home, imageName: "zucqwi_home",selectedImageName:"zucqwi_home_selected")
                    Spacer()
                    navButton(tab: .discover, imageName: "hqinid_discover",selectedImageName: "hqinid_discover_selected")
                    Spacer()
                    navButton(tab: .chat, imageName: "uiqndsad_chat",selectedImageName: "uiqndsad_chat_selected")
                    Spacer()
                    navButton(tab: .profile, imageName: "uqiwdna_mine",selectedImageName: "uqiwdna_mine_selected")
                    Spacer()
                }
                .padding(.vertical, 16)
                .background(
                    Color.black.opacity(0.9)
                        .cornerRadius(100)
                        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
                )
                .padding(.horizontal, 16)
                .padding(.bottom, 35)
            }
            
        
            
            GlobalPopupView(
                    showReport: $showReport,
                    reportUserId: $reportUserId,
                    showFanKui: $showFanKui,
                    showToast: $showToast,
                    toastMessage: $toastMessage
                )
            
            
        }
        .edgesIgnoringSafeArea(.all)
        
    }

    @ViewBuilder
    func navButton(tab: Tab, imageName: String,selectedImageName: String? = nil,) -> some View {
        Button(action: {
            selectedTab = tab
        }) {
           
                
            ZStack{
                if selectedTab == tab{
                    RoundedRectangle(cornerRadius: 100)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color(red: 152/255, green: 43/255, blue: 251/255),
                                    Color(red: 237/255, green: 55/255, blue: 251/255)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(width: 81, height: 56)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
                }
                                    
               
                
                
                
                Image(selectedTab == tab ? (selectedImageName ?? imageName) : imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 34,height: 34)
                                    
            }.frame(width: 81,height: 34)
                           
        }
    }
}

struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarView()
    }
}
