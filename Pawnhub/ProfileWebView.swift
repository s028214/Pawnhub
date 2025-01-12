//
//  ProfileWebView.swift
//  Pawnhub
//
//  Created by Mason Z. 1/11/25.
//

// NOTE: redudant, this is used in a previous itertion of ContentView in tandem with Tabview - Discarded for aesthetic discrepancies

import SwiftUI

struct ProfileWebView: View {
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
    ProfileWebView()
}
