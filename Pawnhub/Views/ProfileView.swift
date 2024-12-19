//
//  ProfileView.swift
//  Pawnhub
//
//  Created by Mason Z. 12/18/24.
//

import SwiftUI

struct ProfileView: View {
    @State var data: FetchData = FetchData()
    
    // input variables
    @State var user: String = "hyper-n0va"
    @State private var inputText: String = ""
    
    // state variables
    @Binding var accountURL: String
    @Binding var viewState: ViewState
    
    var body: some View {
        ZStack{
            // background
            Rectangle()
                .foregroundColor(Color.black.opacity(0.90))
                .edgesIgnoringSafeArea(.all)
            
            // textfield
            VStack {
                ZStack {
                    /*
                    Rectangle()
                    .fill(Color.black)
                    .frame(width: 195, height: 40)
                    */
                                    
                    // The TextField itself
                    TextField("Username", text: $inputText, onCommit: {
                        user = inputText
                    })
                    .autocapitalization(.none)
                    .padding(.horizontal)
                    .frame(width: 195, height: 40)
                    .padding(.bottom, -6)
                }
                
                // profile
                Button(action: {
                    accountURL = data.response.url ?? "www.google.com"
                    viewState = .webView
                },label: {
                    VStack (alignment: .center, content: {
                        // Profile
                        AsyncImage(url: data.response.avatar){
                            phase in
                            switch phase {
                            case .empty:
                                if ((data.response.username?.isEmpty) != nil)  {
                                    Image("blank") // if user exists, but does not have pfp
                                        .resizable()
                                        .aspectRatio(contentMode:.fit)
                                } else {
                                    Image("fnf") // if user does not exist
                                        .resizable()
                                        .aspectRatio(contentMode:.fit)
                                }
                                
                            case.failure: // if failure
                                Image("fnf")
                                    .resizable()
                                    .aspectRatio(contentMode:.fit)
                             
                            case .success(let image): // if user exists + have pfp
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                            default: // loading - in case of slow API call
                                ProgressView()
                            }
                        }
                        .frame(height: 165)
                        .cornerRadius(25)
                        
                        // title (if applicable) + username
                        HStack {
                            if ((data.response.title?.isEmpty) != nil) {
                                Text(data.response.title ?? "")
                                    .padding(.all, 2)
                                    .background(Color.red)
                                    .cornerRadius(5)
                                    .padding(.top, 5)
                            }
                            Text(data.response.username ?? "ERROR 404")
                                .font(.title)
                        }
                        .bold()
                        .padding(.all, 2)
                        
                        // if profile exists
                        // name, location, followers, league
                        if ((data.response.username?.isEmpty) != nil) {
                            // name, location (if applicable)
                            HStack {
                                Text(data.response.name ?? "[N/A]")
                                    .padding(.trailing, 15)
                                
                                HStack {
                                    Image(systemName: "mappin.and.ellipse")
                                        .padding(.trailing, -5)
                                    Text(data.response.location ?? "[N/A]")
                                }
                            }
                            .font(.caption)
                            .padding(.bottom, 2)
                            
                            // followers, league
                            VStack {
                                Text("Followers: \(data.response.followers ?? 0)")
                                    .padding(.bottom, 2)
                                
                                if ((data.response.league?.isEmpty) != nil) {
                                    Text("🏆 \(data.response.league ?? "")")
                                }
                            }
                            .font(.caption)
                        }
                        
                        // if profile doesn't exist
                        else {
                            Text("Not Found")
                                .font(.title3)
                                .padding(.top, -15)
                                .padding(.bottom, 5)
                            
                            VStack {
                                Text("The requested user '\(user.lowercased())' does not exist.")
                                
                                Text("Please double check your query.")
                            }.font(.caption)
                           
                        }
                    })
                }) 
                .padding(.all)
                .foregroundColor(Color.white)
                .background(Color.black)
        }
        // fetch new data on user change
        .onChange(of: user) {
            Task {
                data = await data.getData(from: "https://api.chess.com/pub/player/\(user)")
            }
        }
        // fetch inital data
        .task {
            data = await data.getData(from: "https://api.chess.com/pub/player/\(user)")
        }
         .background(Color.white)
        }
    }
}
        
#Preview {
    ProfileView(accountURL: .constant("https://www.chess.com/"), viewState: .constant(.profileView))
}
