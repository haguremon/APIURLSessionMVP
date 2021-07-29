//
//  GitHubhguremon.swift
//  APIURLSessionMVP
//https://api.github.com/search/repositories?q=user&haguremon
//https://api.github.com/search/repositories?q=haguremon&per_page=50
//github_search_repositoryの
//Created by IwasakIYuta on 2021/07/28.
//https://api.github.com/search/repositories?q=user:haguremon //これを探すのに時間がかかった
//https://api.github.com/users/haguremon
//https://api.github.com/users/haguremon/repos
import Foundation
//所得する情報structをふたつ作成


//struct SearchResponse<Item:Codable>:Codable {
//    var totalCount: Int
//    var items: [Item]
//    enum CodingKeys: String,CodingKey{
//        case totalCount = "total_count"
//        case items
//    }
//    }
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
    //var owner: User
    enum CodingKeys : String, CodingKey {
        case id
        case name
        case fullName = "full_name"
       // case owner
    }
    
}

struct GitHubhaguremon: Codable {
    let login: String
    let bio: String
    let updatedat: String
    //let reposurl: HaguremonRepository
    enum CodingKeys : String, CodingKey {
        case login//ここ二つ書かないといけないらしいｗ
        case bio
        case updatedat = "updated_at"
        //case reposurl = "repos_url"
    }
}
//struct User: Codable {
//    var id: Int
//    var login: String
//}

