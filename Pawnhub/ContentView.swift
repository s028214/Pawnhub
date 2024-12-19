//
//  ContentView.swift
//  Pawnhub
//
//  Created by Mason Z. on 12/18/24.
//

import SwiftUI

struct ContentView: View {
    @State var viewState: ViewState = .profileView
    @State var accountURL: String = "https://api.chess.com/pub/player/hyper-n0va"
    
    
    var body: some View {
        if viewState == .profileView {
            ProfileView(accountURL: $accountURL, viewState: $viewState)
        } else {
            WebViewContainer(accountURL: $accountURL, viewState: $viewState)
        }
    }
}

#Preview {
    ContentView()
}
