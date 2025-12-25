//
//  OrnixApp.swift
//  Ornix
//
//  Created by yangyang on 2025/12/16.
//

import SwiftUI

@main
struct OrnixApp: App {
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
