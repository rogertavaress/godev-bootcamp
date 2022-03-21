//
//  ViewController.swift
//  desafioAPITableView
//
//  Created by Rogério Tavares on 21/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableview: UITableView!
    @IBOutlet var loadingActivityIndicator: UIActivityIndicatorView!
    
    var CEOs = [CEOModel]() {
        didSet {
            DispatchQueue.main.async {
                self.onUpdated()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        registerCells()
        loadData()
    }
    
    private func delegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    private func registerCells() {
        let nib = UINib(nibName: CEOTableViewCell.identifier, bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: CEOTableViewCell.identifier)
    }
    
    private func loadData() {
        GetListService.shared.execute { result in
            switch result {
            case .success(let newList):
                self.CEOs = newList
            case .failure(_):
                print("Deu ruim!")
            }
        }
    }
    
    private func onUpdated() {
        DispatchQueue.main.async { [self] in
            tableview.reloadData()
            loadingActivityIndicator.stopAnimating()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CEOs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: CEOTableViewCell.identifier, for: indexPath) as? CEOTableViewCell else { return UITableViewCell() }
        
        let CEO = CEOs[indexPath.row]
        
        cell.configure(with: CEO)
        
        return cell
    }
    
    
}

