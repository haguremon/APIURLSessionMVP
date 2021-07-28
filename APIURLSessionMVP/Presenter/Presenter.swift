//
//  Presenter.swift
//  APIURLSessionMVP
//
//  Created by IwasakIYuta on 2021/07/28.
//https://api.github.com/users/haguremon
//https://api.github.com/users/haguremon/subscriptions
import Foundation
protocol MygithubAPIDelegate: AnyObject {
    func didsetUser(user: [GitHubhaguremon])
    //func didsetRepository(repository: [Subscriptions])
}
class MygitHub {
    typealias delgatepr = MygithubAPIDelegate & ViewController
    weak var delegate: delgatepr?
    func getApi(){
        guard let url = URL(string:"https://api.github.com/users/haguremon") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            print("PPPPPPPPPPPPPPP")
            guard let data = data ,
                let response = response as? HTTPURLResponse, error == nil else{ return }
            guard response.statusCode == 200 else { return }
            do {
                let user = try JSONDecoder().decode(GitHubhaguremon.self, from: data)
                self?.delegate?.didsetUser(user: [user])
            }catch{
                print(error)
            }
        }
        task.resume()
    
    }
    func setPresnter(delegate: delgatepr){
        self.delegate = delegate
    }
        
}
    


