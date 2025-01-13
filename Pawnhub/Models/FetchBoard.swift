//
//  FetchBoard.swift
//  NewsAPI
//
//  Created by Mason Z 1/10/24
//

import Foundation

struct FetchBoard{ // differs from FetchData() calls upon Reply (Response -> Profile)
    var response: Reply = Reply()
    
    mutating func getData() async -> FetchBoard{
        let URLString = "https://api.chess.com/pub/leaderboards"
        guard let url = URL(string: URLString) else { return self }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            var newReply = try JSONDecoder().decode(Reply.self, from: data)
            newReply = try! JSONDecoder().decode(Reply.self, from: data)
            let dataString = String(data: data, encoding: .utf8)
            print(dataString ?? " ")

            return FetchBoard(response: newReply)
        } catch {
            print("Error: \(error)")
            return self
        }
    }
}

struct Reply: Codable {
    var daily: [Profile] = []
}

struct Profile: Codable {
    var avatar: URL? // ✅
    var score: Int  // ✅
    var rank: Int // ✅
    var username: String? // ✅
    var title: String? // ✅
}

extension Profile: Identifiable {
    var id: String {username ?? ""}
}
