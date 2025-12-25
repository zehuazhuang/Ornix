//
//  SettingView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/17.
//

import SwiftUI
import AlertToast



struct SettingRowViewText: View {
    let title: String
    let action: () -> Void
    
   

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(
                        title == "Delete Account" ? Color(red: 237/255, green: 55/255, blue: 251/255) : .white)

                Spacer()

                Image("uiqwnvw_go")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 22, height: 22)
            }.padding(.vertical,6)
                .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

enum SettingRoute: Identifiable {
    case whimsical
    case blocklist

    var id: Int { hashValue }
}

struct SettingView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var route: SettingRoute?
    @State private var adaptingUrl: String = ""
    
    @State private var showEdit: Bool = false
    @State private var showDelete: Bool = false
    @State private var showToast = false
    @State private var toastMessage = ""
    
    let onUpdate: () -> Void
    
    var body: some View {
        ZStack{
            Image("asiudiq_bei")
                .resizable()
               
                .ignoresSafeArea()
            
            VStack(spacing:12){
                HStack{
                    Button(action: {
                        dismiss()
                        onUpdate()
                    }) {
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
                    Text("Settings")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.trailing,36)
                    Spacer()
                }.padding(.top,5)
                   
                
                SettingRowViewText(title: "Modify personal information") {
                   
                    
                    withAnimation { showEdit = true }
                }
                SettingRowViewText(title: "Blacklist") {
                    route = .blocklist
                }
                SettingRowViewText(title: "Privacy Policy") {
                    adaptingUrl="https://app.r2f2wgvf.link/privacy"
                    route = .whimsical
                }
                SettingRowViewText(title: "User Agreement") {
                    adaptingUrl="https://app.r2f2wgvf.link/users"
                    route = .whimsical
                }
                SettingRowViewText(title: "Delete Account") {
                    showDelete = true
                }
                SettingRowViewText(title: "Log Out") {
                    GlobalLoadingManager.shared.show()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        GlobalLoadingManager.shared.hide()
                        AppStorageManager.shared.clearCurrentUser()
                    }
                    
                    
               
                    
                }
                
                Spacer()
                
            }.padding(.horizontal,16)
            
            if showEdit {
                Color.black.opacity(0.35)
                    .ignoresSafeArea()
                    .onTapGesture { withAnimation { showEdit = false } }
                
                EditInfoView(onSave:{
                    GlobalLoadingManager.shared.show()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                        GlobalLoadingManager.shared.hide()
                        
                        showToast = true
                        toastMessage = "Modification successful"
                        
                       
                    }
                }).transition(.move(edge: .bottom))
            }
            
            if showDelete {
                Color.black.opacity(0.35)
                    .ignoresSafeArea()
                    .onTapGesture { withAnimation { showDelete = false } }
                
                DeleteCkView(onDismiss:{
                   
                    withAnimation { showDelete = false }
                },
                             onDelete:{
                    GlobalLoadingManager.shared.show()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                        GlobalLoadingManager.shared.hide()
                        
                        if(AppStorageManager.shared.getCurrentUserId() == AppStorageManager.shared.getTouristsUserId()){
                            AppStorageManager.shared.clearTouristsUser()
                        }
                        
                        AppStorageManager.shared.deleteUser(uid: AppStorageManager.shared.getCurrentUserId())
                    }
                    
                }
                
                )
            }
            
            
            GlobalLoadingView()
            
        }
        .toast(isPresenting: $showToast) {
            AlertToast(type: .regular, title: toastMessage)
        }
        .fullScreenCover(item: $route) { route in
            switch route {
            case .whimsical:
                WhimsicalView(stackingUrl: adaptingUrl)
            case .blocklist:
                BlockListView()
        
               
            }
        }
    }
}


