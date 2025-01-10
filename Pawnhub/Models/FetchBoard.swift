//
//  FetchData.swift
//  NewsAPI
//
//  Created by Mason Z & Minh D 12/18/24.

//

import Foundation

struct FetchBoard{
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
    var url: String?
    var name: String? // ✅
    var username: String? // ✅
    var title: String? // ✅
    var followers: Int?
    var location: String? // ✅
    var league: String?
}

extension Profile: Identifiable {
    var id: String {username ?? ""}
}
