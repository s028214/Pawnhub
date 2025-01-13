//
//  ContentView.swift
//  Pawnhub
//
//  Created by Mason Z & Minh D 1/12/25

import SwiftUI

struct ContentView: View {
    @State var viewState: ViewState = .profileView
    @State var accountURL: String = "https://api.chess.com/pub/player/hyper-n0va"
    
    var body: some View {
        /*
         TabView{
         ProfileWebView()
         .tabItem {
         Image(systemName: "person.crop.circle.fill")
         Text("Profile")
         }
         LeaderboardView()
         .tabItem {
         Image(systemName: "list.number")
         Text("Leaderboards")
         
         }
         
         }
         .background(.white)
         */ // TAB VIEW HAS COLOR ISSUE - easier method, but aesthetically has unresolved issues.
        
        let profileColor: Color = viewState == .profileView ? .blue : .gray
        
        let leaderBoardColor: Color = viewState == .LeaderboardView ? .blue : .gray
        
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                
                // profile view (change color)
                if viewState == .profileView {
                    ProfileView(accountURL: $accountURL, viewState: $viewState)
                }
                
                // leaderboard view (change color)
                else if viewState == .LeaderboardView{
                    LeaderboardView()
                }
                
                // WebView
                else {
                    WebViewContainer(accountURL: $accountURL, viewState: $viewState)
                }
                
                if viewState != .webView {
                    HStack {
                        Spacer()
                        Button(action: {
                            viewState = .profileView
                        }, label: {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.top, 10)
                                .foregroundColor(profileColor)
                            
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            viewState = .LeaderboardView
                        }, label: {
                            Image(systemName: "list.number")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.top, 10)
                                .foregroundColor(leaderBoardColor)
                            
                        })
                        
                        Spacer()
                    }.background(.black)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
