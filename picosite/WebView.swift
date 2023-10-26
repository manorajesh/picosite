//
//  WebView.swift
//  picosite
//
//  Created by Mano Rajesh on 10/25/23.
//

import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
    let url: URL
    @Binding var webView: WKWebView  // Existing line
    @Binding var progress: Float  // Add this line for progress tracking

    func makeNSView(context: Context) -> WKWebView {
        webView.navigationDelegate = context.coordinator  // Add this line
        return webView  // Existing line
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        nsView.load(request)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)  // Add this line
    }

    // Add a Coordinator for observing the WKWebView's estimated progress
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        }

        override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
            if keyPath == "estimatedProgress" {
                if let newProgress = change?[.newKey] as? Float {
                    parent.progress = newProgress
                }
            }
        }
    }
}

