//
//  WebView.swift
//  JSON Decoding 1
//
//  Inital Credits: S. Thomas on 12/16/21.
//

import SwiftUI
import WebKit

struct SwiftUIWebView : UIViewRepresentable{
    
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        return WKWebView(frame: .zero, configuration: config)
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let updatedString = urlString.replacingOccurrences(of: "http:", with: "https:")
        print(updatedString)
        guard let url = URL(string: updatedString) else{
            print("failed")
            return
        }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
    
}
