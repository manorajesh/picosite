//
//  ContentView.swift
//  picosite
//
//  Created by Mano Rajesh on 10/25/23.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @State private var url = URL(string: "https://www.google.com")!
    @State private var progress: Float = 0.0
    @State private var webView = WKWebView()
    @State private var isLoading = true
    @State private var showAlert = false
    
    var body: some View {
        WebView(url: url, webView: $webView, progress: $progress)
            .toolbar {
                ToolbarItemGroup {
                    if isLoading {
                        ProgressView()
                            .scaleEffect(0.5)
                    } else {
                        switch url.scheme {
                        case "https":
                            Button {
                                
                            } label: {
                                Image(systemName: "lock.fill")
                            }
                        default:
                            Button {
                                
                            } label: {
                                Image(systemName: "lock.open.trianglebadge.exclamationmark.fill")
                            }
                            .help("Webkit is using an unsecure connection to \(url.host ?? "unknown site")")
                        }
                    }
                    Button {
                        webView.reload()
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                    .keyboardShortcut("r", modifiers: .command)
                }
            }
            .navigationTitle(url.host ?? "unknown site")
            .ignoresSafeArea(.container, edges: .top)
            .onAppear {
                webView.customUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 14_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Safari/605.1.15"
            }
            .onChange(of: progress) { newValue in
                if newValue >= 1 {
                    withAnimation {
                        isLoading = false
                    }
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("hello"))
            }
    }
}

#Preview {
    ContentView()
}
