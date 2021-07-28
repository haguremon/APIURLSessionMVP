//
//  GitHubhguremon.swift
//  APIURLSessionMVP
//
//  Created by IwasakIYuta on 2021/07/28.
//https://api.github.com/users/haguremon
//https://api.github.com/users/haguremon/subscriptions 
import Foundation
//所得する情報structをふたつ作成

struct GitHubhaguremon: Codable {
    let login: String
    let bio: String
    let updatedat: String
    //let reposurl: HaguremonRepository
    //
    enum CodingKeys : String, CodingKey {
        case login//ここ二つ書かないといけないらしいｗ
        case bio
        case updatedat = "updated_at"
        //case reposurl = "repos_url"
    }
}
struct User: Codable {
    var id: Int
    var login: String
}
    struct HaguremonRepository: Codable {
        let id: Int
        let name: String
        var fullName: String
        var owner: User
        enum CodingKeys : String, CodingKey {
            case id
            case name
            case fullName = "full_name"
            case owner
        }
        
    }

