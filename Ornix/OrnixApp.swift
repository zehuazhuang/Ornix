//
//  OrnixApp.swift
//  Ornix
//
//  Created by yangyang on 2025/12/16.
//

import SwiftUI
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return .portrait
    }
}

@main
struct OrnixApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @AppStorage("currentUserId") var currentUserId: Int = -1
    init() {
            
        AppStorageManager.shared.initializeAllDefaults()

        
        
        }
    
    var body: some Scene {
        WindowGroup {
                  ZStack {
                     
                      if currentUserId != -1 {
                          NavBarView()
                      } else {
                         
                          ChooseInitView()
                              .transition(.opacity)
                              .animation(.easeInOut(duration: 0.5), value: currentUserId)
                      }
                  }
              }
    }
}
