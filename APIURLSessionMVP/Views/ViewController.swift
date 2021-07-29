//
//  ViewController.swift
//  APIURLSessionMVP
//
//  Created by IwasakIYuta on 2021/07/28.
//

import UIKit

class ViewController: UIViewController {
    private var haguremon = [GitHubhaguremon]()
    private var haguremonrepository = [HaguremonRepository]()
    private let identifie = "cell"
    @IBOutlet weak var tableView: UITableView!
    private let mygitHub = MygitHub()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mygitHub.setPresenter(delegate: self)
        mygitHub.getHaguremon()
        
        tableView.delegate = self
        tableView.dataSource = self
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return haguremon.count
        case 1:
            return haguremonrepository.count
        default:
            return 0
        }
  
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifie, for: indexPath)
        let imageView = view.viewWithTag(1) as? UIImageView
        imageView?.clipsToBounds = true
        switch indexPath.section{
        case 0:
            let avatarImage =  haguremon[indexPath.row].avatarurl
            let imageUrl = URL(string: avatarImage)!
            let imageData = try! Data(contentsOf: imageUrl)
            imageView?.image = UIImage(data: imageData)
            cell.textLabel?.text = haguremon[indexPath.row].login
        return cell
        case 1:
            cell.textLabel?.text = "\(haguremonrepository[indexPath.row].name)"
        return cell
        default:
            return cell
        }
        

}
    func alert(title: String,message:String ){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            alert(title: "taped cell", message: "\(haguremon[indexPath.row].bio)\n\(haguremon[indexPath.row].updatedat)")
        case 1:
            alert(title: "taped cell", message: "\(haguremonrepository[indexPath.row].fullName)")
        default:
            break
        }
    
    }
}
extension ViewController : MygithubAPIDelegate{
    func didsetRepository(items: [HaguremonRepository]) {
        self.haguremonrepository = items
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        
        }
    }
    
    func didsetUser(user: [GitHubhaguremon]) {
        self.haguremon = user
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
   
    }
    
    }
