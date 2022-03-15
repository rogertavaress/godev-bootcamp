//
//  ViewController.swift
//  aula06.02
//
//  Created by Rogério Tavares on 14/03/22.
//

import UIKit

struct Country {
    var logo: String
    var nome: String
    var description: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    var counties = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        
        title = "Países"
        
        counties = [
            Country(
                logo: "brazil",
                nome: "Brasil",
                description: "la lal alalal lallalal alallala lallal lllal"
            ),
            Country(
                logo: "argentina",
                nome: "Argentina",
                description: "la lal alalal lallalal alallala lallal lllal"
            )
        ]
    }
    
    func delegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Eu cliquei no país: \(counties[indexPath.row].nome)")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return counties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        let country = counties[indexPath.row]
        
        cell.setup(logo: country.logo, name: country.nome, description: country.description)
        
        return cell
    }
}
