//
//  ViewController.swift
//  aula07
//
//  Created by Rogério Tavares on 15/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        registerCell()
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 200))
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 200))
        
        header.backgroundColor = .orange
        footer.backgroundColor = .blue
        
        tableview.tableHeaderView = header
        tableview.tableFooterView = footer
    }

    private func delegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    private func registerCell() {
        let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        
        
        return cell
    }
}

