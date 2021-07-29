//
//  GitHubhguremon.swift
//  APIURLSessionMVP
//github_search_repositoryの
//Created by IwasakIYuta on 2021/07/28.
//https://api.github.com/search/repositories?q=user:haguremon //これを探すのに時間がかかった
//https://api.github.com/users/haguremon

import Foundation
struct GitHubhaguremon: Codable {
    let login: String
    let bio: String
    let updatedat: String
    let avatarurl: String
    enum CodingKeys : String, CodingKey {
        case login//ここ二つ書かないといけないらしいｗ
        case bio
        case avatarurl = "avatar_url"
        case updatedat = "updated_at"
    
    }
}

struct Repository: Codable {
    let totalcount: Int
    let items: [HaguremonRepository]
    
    enum CodingKeys : String, CodingKey {
        case totalcount = "total_count"
        case items
        
    }
    
}
struct HaguremonRepository: Codable {
    let id: Int
    let name: String
    var fullName: String
    enum CodingKeys : String, CodingKey {
        case id
        case name
        case fullName = "full_name"
    }
    
}
