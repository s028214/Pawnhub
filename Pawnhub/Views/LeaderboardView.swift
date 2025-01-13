//
//  LeaderboardView.swift
//  Pawnhub
//
//  Created by Mason Z on 1/10/25.
//

import SwiftUI

struct LeaderboardView: View {
  @State var data: FetchBoard = FetchBoard()

  var body: some View {
    ZStack {
        // background
        Rectangle()
            .foregroundColor(Color.backgroundGray)
            .edgesIgnoringSafeArea(.all)
        VStack {
            Text("Daily Leaderboard")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
            
            ScrollView {
                ForEach(data.response.daily) { a in
                    VStack (alignment: .leading, content: {
                        HStack{
                            /*if a.rank == 1 {
                             ZStack {
                                 Image(systemName: "crown.fill")
                                     .resizable()
                                     .scaledToFit()
                                     .frame(width: 40, height: 40)
                                     .foregroundColor(.yellow)

                                 Text("\(a.rank)")
                                     .font(.caption)
                                     .bold()
                                     .foregroundColor(.white)
                             }
                             .frame(width: 40, height: 40)
                         }*/
                            
                            // Profile
                            AsyncImage(url: a.avatar){
                                phase in
                                switch phase {
                                case .empty:
                                    if ((a.username?.isEmpty) != nil)  {
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
                            .frame(width: 60, height: 60)
                            .cornerRadius(5)
                            .padding(.all)
                            
                            
                            //  username, elo, ranking
                            VStack (alignment: .leading, content: {
                                // ranking conditions
                                VStack {
                                    if a.rank == 1 {
                                        Image(systemName: "crown.fill")
                                            .resizable()
                                            .foregroundColor(.yellow)
                                    }
                                    
                                    else if a.rank == 2 {
                                        Image(systemName: "crown.fill")
                                            .resizable()
                                            .foregroundColor(.gray)
                                    }
                                    
                                    else if a.rank == 3 {
                                        Image(systemName: "crown.fill")
                                            .resizable()
                                            .foregroundColor(.brown)
                                    }
                                    
                                    else { 
                                        Text("\(a.rank)")
                                            .padding(.bottom, -6)
                                    }
                                    
                                }
                                .scaledToFit()
                                .frame(width: 22, height: 22)
                                .padding(.bottom, -8)
                                
                                
                                
                                Text(a.username ?? "ERROR 404")
                                    .font(.title)
                                    .padding(.horizontal, 2)
                                Text("(\(a.score))")
                                    .padding(.bottom, 10)
                            })
                            Spacer()
                            
                            // title
                            if ((a.title?.isEmpty) != nil) {
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(Color.red)
                                        .frame(width: 50, height: 100)
                                    
                                    Text(a.title ?? "")
                                        .font(.title2)
                                        .padding(.all, 8)
                                }
                            }
                        }
                        .bold()
                        .foregroundColor(Color.white)
                        
                    })
                    .background(Color.black)
                    .cornerRadius(15)
                    .padding(.all, 5)
                }
            }
        }
    }
    .task {
      // Fetch data and update the state after successful retrieval
      let newData = await data.getData()
      data = newData
    }
      
  }
}

#Preview {
    LeaderboardView()
}
