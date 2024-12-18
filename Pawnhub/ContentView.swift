//
//  ContentView.swift
//  Pawnhub
//
//  Created by Mason Zhu (student LM) on 12/18/24.
//

import SwiftUI

struct ContentView: View {
    @State var viewState: ViewState = .profileView
    @State var accountURL: String = "https://api.chess.com/pub/player/magnuscarlsen"
    
    
    var body: some View {
        /*   VStack {
         Image(.aaa).resizable().aspectRatio(contentMode:.fit)
         .foregroundStyle(.tint)
         
         } */
        Text("CONTENT VIEW")
    }
}

#Preview {
    ContentView()
}
