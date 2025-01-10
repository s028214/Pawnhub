//
//  LeaderboardView.swift
//  Pawnhub
//
//  Created by Mason Zhu (student LM) on 1/10/25.
//

import SwiftUI

struct LeaderboardView: View {
  @State var data: FetchBoard = FetchBoard()

  var body: some View {
    VStack {
      ScrollView {
        ForEach(data.response.daily) { a in
          VStack {
            Text(a.name ?? "")
              .font(.title)
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
