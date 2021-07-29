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
    
    func didsetRepository(items: [HaguremonRepository])
}
 
class MygitHub {
    typealias vcdelegate = MygithubAPIDelegate & ViewController
    
    weak var delegate: vcdelegate?
    
    func getApi(url: String) {
        guard let url = URL(string:url) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let data = data ,
                  let response = response as? HTTPURLResponse,
                      error == nil else { return }
            
            guard response.statusCode == 200 else { return }
            //do連続をどうにかしたい
            do {
               
                let user = try JSONDecoder().decode(GitHubhaguremon.self, from: data)
                self?.delegate?.didsetUser(user: [user])
           
            } catch {
                
                print(error)
           
            }
           
            do {
                
                let repository = try JSONDecoder().decode(Repository.self, from: data)
                let items =  repository.items
                self?.delegate?.didsetRepository(items: items)
            
            } catch {
                
                print(error)
            
            }
        
        }
        
        task.resume()
        
    }
    func getHaguremon(){
        
        getApi(url: "https://api.github.com/users/haguremon")
        
        DispatchQueue.main.async {
            
            self.getApi(url: "https://api.github.com/search/repositories?q=user:haguremon")
        }
    }
    
    func setPresenter(delegate: vcdelegate){
        
        self.delegate = delegate
    
    }
    
}



