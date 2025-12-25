//
//  WhimsicalView.swift
//  Ornix
//
//  Created by yangyang on 2025/12/18.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

struct WhimsicalView: View {
    @Environment(\.dismiss) var dismiss
    let stackingUrl: String

    var body: some View {
        ZStack {
            Image("asiudiq_bei")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 0) {
                
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image("zkugcq_back")
                            .resizable()
                            .frame(width: 15, height: 10)
                            .frame(width: 36, height: 36)
                            .background(
                                Color.black.opacity(0.2)
                                    .clipShape(Circle())
                            )
                    }
                    .padding(.leading, 16)
                    Spacer()
                }
                .padding(.top, 55)
                .padding(.bottom,20)

                // WebView
                WebView(urlString: stackingUrl)
                    .ignoresSafeArea(edges: .bottom)
            }
        }
    }
}


#Preview {
    WhimsicalView(stackingUrl:"")
}
