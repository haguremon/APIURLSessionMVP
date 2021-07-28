//
//  ViewController.swift
//  APIURLSessionMVP
//
//  Created by IwasakIYuta on 2021/07/28.
//

import UIKit

class ViewController: UIViewController {
    private var haguremon = [GitHubhaguremon]()
    private let identifie = "cell"
    @IBOutlet weak var tableView: UITableView!
    private let mygitHub = MygitHub()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mygitHub.setPresnter(delegate: self)
        mygitHub.getApi()
        
        tableView.delegate = self
        tableView.dataSource = self
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return haguremon.count
  
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifie, for: indexPath)
        cell.textLabel?.text = haguremon[indexPath.row].login
        return cell

}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "taped cell", message: "\(haguremon[indexPath.row].bio)\n\(haguremon[indexPath.row].updatedat)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
    extension ViewController : MygithubAPIDelegate{
    
    func didsetUser(user: [GitHubhaguremon]) {
        self.haguremon = user
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
