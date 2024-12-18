//
//  ContentView.swift
//  Pawnhub
//
//  Created by Mason Zhu (student LM) on 12/18/24.
//

import SwiftUI

struct ContentView: View {
    @State var data: FetchData = FetchData()
    
    var body: some View {
        /*   VStack {
         Image(.aaa).resizable().aspectRatio(contentMode:.fit)
         .foregroundStyle(.tint)
         
         } */
        VStack{
            Text(data.response.name ?? "N/A")
            
        }
    }
}

#Preview {
    ContentView()
}
