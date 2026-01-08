

import SwiftUI
import Combine

class GlobalLoadingManager: ObservableObject {
    static let shared = GlobalLoadingManager()
    
    @Published var isLoading: Bool = false
    
    private init() {}
    
    func show() {
        DispatchQueue.main.async {
            self.isLoading = true
        }
    }
    
    func hide() {
        DispatchQueue.main.async {
            self.isLoading = false
        }
    }
}

struct GlobalLoadingView: View {
    @ObservedObject var manager = GlobalLoadingManager.shared
    
    var body: some View {
        if manager.isLoading {
            ZStack {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                
                ProgressView("Loading...")
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
            .transition(.opacity)
            .animation(.easeInOut, value: manager.isLoading)
        } else {
            EmptyView()
        }
    }
}
