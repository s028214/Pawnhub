//
//  FetchData.swift
//  NewsAPI
//
//  Created by Mason Z. on 12/12/24.
//

import Foundation

struct FetchData{
    var response: Response = Response()
    
    mutating func getData() async{
        let URLString = "https://api.chess.com/pub/player/hyper-n0va"
        
        guard let url = URL(string: URLString) else {return}
        
        let(data, _) = try! await URLSession.shared.data(from: url)
        response = try! JSONDecoder().decode(Response.self, from: data) // decoded JSON
        
        let dataString = String(data: data, encoding: .utf8)
        print(dataString ?? " ")
    }
}

struct Response: Codable {
    var avatar: URL? // ✅
    var url: URL?
    var name: String? // ✅
    var username: String? // ✅
    var title: String? // ✅
    var followers: Int?
    var location: String? // ✅
    var league: String?
}
