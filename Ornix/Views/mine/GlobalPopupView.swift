//
//  GlobalPopupView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/23.
//

import SwiftUI

struct GlobalPopupView: View {
    @Binding var showReport: Bool
    @Binding var reportUserId: Int?
    
    @Binding var showFanKui: Bool
    @Binding var showToast: Bool
    @Binding var toastMessage: String
    
    var body: some View {
        ZStack {
            // ReportView
            if showReport, let uid = reportUserId {
                Color.black.opacity(0.35)
                    .ignoresSafeArea()
                    .onTapGesture { withAnimation { showReport = false } }

                ReportView(
                    enamelUid: uid,
                    onDismiss: { withAnimation { showReport = false } },
                    onReport: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                            withAnimation { showFanKui = true }
                        }
                    },
                    onBlock:{
                        showToast = true
                        toastMessage = "success"
                    }
                )
                .transition(.move(edge: .bottom))
                .zIndex(100)
            }

            // FanKuiView
            if showFanKui {
                Color.black.opacity(0.35)
                    .ignoresSafeArea()
                    .onTapGesture { withAnimation { showFanKui = false } }

                FanKuiView(onDismiss: {
                    withAnimation {
                        showFanKui = false
                        showToast = true
                        toastMessage = "Thank you for your feedback."
                    }
                })
                .transition(.move(edge: .bottom))
                .zIndex(101)
            }

            // Toast
            if showToast {
                Text(toastMessage)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .transition(.opacity)
                    .zIndex(102)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation { showToast = false }
                        }
                    }
            }
        }
    }
}
