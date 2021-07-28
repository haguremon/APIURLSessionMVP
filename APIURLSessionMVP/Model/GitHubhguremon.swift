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
    
    //
    enum CodingKeys : String, CodingKey {
        case login//ここ二つ書かないといけないらしいｗ
        case bio
        case updatedat = "updated_at"

    }
}
