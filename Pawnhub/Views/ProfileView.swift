//
//  ProfileView.swift
//  Pawnhub
//
//  Created by Mason Zhu (student LM) on 12/18/24.
//

import SwiftUI

struct ProfileView: View {
    @State var data: FetchData = FetchData()
    
    var body: some View {
        ZStack{
            
            Rectangle()
                .foregroundColor(Color.black.opacity(0.90))
                .edgesIgnoringSafeArea(.all)
            VStack {
                
            Button(action: {
                // TODO
            },label: {
                /*
                 VStack (alignment: .center, content: {
                 HStack {
                 AsyncImage(url: data.response.avatar){
                 phase in
                 switch phase {
                 case.failure:
                 Image("fnf")
                 .resizable()
                 .aspectRatio(contentMode:.fit)
                 
                 case .success(let image):
                 image
                 .resizable()
                 .aspectRatio(contentMode: .fit)
                 
                 default:
                 ProgressView()
                 }
                 }
                 .frame(height: 60)
                 .cornerRadius(25)
                 
                 VStack {
                 Text(data.response.name ?? "N/A")
                 .font(.title)
                 .bold()
                 Text("👤 \(data.response.followers ?? 0)")
                 .font(.caption)
                 
                 }
                 }
                 
                 
                 
                 })
                 */
                VStack (alignment: .center, content: {
                    
                    AsyncImage(url: data.response.avatar){
                        phase in
                        switch phase {
                        case.failure:
                            Image("fnf")
                                .resizable()
                                .aspectRatio(contentMode:.fit)
                            
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                        default:
                            ProgressView()
                        }
                    }
                    .frame(height: 165)
                    .cornerRadius(25)
                    
                    HStack{
                        if ((data.response.title?.isEmpty) != nil) {
                            Text(data.response.title ?? "")
                                .padding(.all, 2)
                                .background(Color.red)
                                .cornerRadius(5)
                                .padding(.top, 5)
                        }
                        Text(data.response.username ?? "[No Username]")
                            .font(.title)
                    }
                    .bold()
                    .padding(.all, 2)
                    
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
        
                    Text("👤 \(data.response.followers ?? 0)")
                        .padding(.all, 2)
                })
            }) .foregroundColor(Color.white)
                .padding(.all)
                .background(Color.black)
            //n Spacer()
                
                
        }
        }.task {
            await data.getData()
        }
    }
}
        
#Preview {
    ProfileView()
}
