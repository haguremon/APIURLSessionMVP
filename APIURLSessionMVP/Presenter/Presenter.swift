//
//  Presenter.swift
//  APIURLSessionMVP
//
//  Created by IwasakIYuta on 2021/07/28.
//https://api.github.com/users/haguremon
//https://api.github.com/users/haguremon/repos
import Foundation
protocol MygithubAPIDelegate: AnyObject {
    func didsetUser(user: [GitHubhaguremon])
    func didsetRepository(repository: [HaguremonRepository])
}
class MygitHub {
    typealias delgatepr = MygithubAPIDelegate & ViewController
    weak var delegate: delgatepr?
    func getApi(url: String){
        guard let url = URL(string:url) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            print("PPPPPPPPPPPPPPP")
            guard let data = data ,
                let response = response as? HTTPURLResponse, error == nil else{ return }
            guard response.statusCode == 200 else { return }
//            var request = URLRequest(url: url)
//            request.httpMethod = "GET"
            do {
                let user = try JSONDecoder().decode(GitHubhaguremon.self, from: data)
                print(user)
                self?.delegate?.didsetUser(user: [user])
                let repository = try JSONDecoder().decode(HaguremonRepository.self, from: data)
                self?.delegate?.didsetRepository(repository: [repository])
              print(repository)
            }catch{
                print(error)
            }
        }
        task.resume()
    
    }
    func getHaguremon(){
        getApi(url: "https://api.github.com/users/haguremon")
    }
    func getRepository(){
        getApi(url: "https://api.github.com/users/haguremon/repos")
    }
    
    
    func setPresnter(delegate: delgatepr){
        self.delegate = delegate
    }
        
}
    


