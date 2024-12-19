//
//  FetchData.swift
//  NewsAPI
//
//  Created by Mason Z. on 12/12/24.
//

import Foundation

struct FetchData{
    var response: Response = Response()
    
    mutating func getData(from URLString: String) async -> FetchData{
       //  let URLString = "https://api.chess.com/pub/player/hyper-n0va"
        
        guard let url = URL(string: URLString) else { return self }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            var newResponse = try JSONDecoder().decode(Response.self, from: data)
            newResponse = try! JSONDecoder().decode(Response.self, from: data)
            let dataString = String(data: data, encoding: .utf8)
            print(dataString ?? " ")

            return FetchData(response: newResponse)
        } catch {
            print("Error: \(error)")
            return self
        }
    }
}

struct Response: Codable {
    var avatar: URL? // ✅
    var url: String?
    var name: String? // ✅
    var username: String? // ✅
    var title: String? // ✅
    var followers: Int?
    var location: String? // ✅
    var league: String?
}
