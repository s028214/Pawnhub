//
//  WebViewContainer.swift
//  NewsAPI
//
//  Created by Mason Z & Minh D 12/18/24.

//

import SwiftUI

// how to implement a page loading screen? like if page is not loaded yet. 
struct WebViewContainer: View {
    @Binding var accountURL: String
    @Binding var viewState: ViewState
    var body: some View {
        VStack{
            Button(action: {
                viewState = .profileView
            }, label: {
                HStack{
                    Text("<")
                        .font(.title)
                        .bold()
                        .padding(.leading, 15)
                    Spacer()
                }
            })
            SwiftUIWebView(urlString: accountURL)
        }
    }
}

#Preview {
    WebViewContainer(accountURL: .constant("https://www.chess.com/"), viewState: .constant(.profileView))
}
