//
//  ViewController.swift
//  aula10
//
//  Created by Rogério Tavares on 18/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableview: UITableView!
    @IBOutlet var loading: UIActivityIndicatorView!
    
    lazy var users = [User]() {
        didSet {
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        delegates()
        getUsers()
        showLoading()
    }
    
    private func delegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }

    private func getUsers() {
        Service.shared.getUsers { result in
            switch result {
            case .success(let res):
                print("Resultado: \(res)")
                self.users = res
            case .failure(let error):
                print("Error: \(error)")
            }
            self.hideLoading()
        }
    }
    
    private func showLoading() {
        loading.startAnimating()
        loading.isHidden = false
    }
    
    private func hideLoading() {
        DispatchQueue.main.async {
            self.loading.stopAnimating()
            self.loading.isHidden = true
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.company.name
        
        return cell
    }
}
