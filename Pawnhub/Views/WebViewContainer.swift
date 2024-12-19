//
//  WebViewContainer.swift
//  NewsAPI
//
//  Created by Mason Z. on 12/13/24.
//

import SwiftUI

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
    WebViewContainer(accountURL: .constant("www.google.com"), viewState: .constant(.profileView))
}
