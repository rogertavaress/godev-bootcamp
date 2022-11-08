//
//  ViewController.swift
//  aula15Marvel
//
//  Created by Rogério Tavares on 30/03/22.
//

import UIKit

class ViewController: UIViewController {

    let services = HeroListService()
    
    var items: Hero?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemGray
        
        services.execute { result in
            switch result {
            case .success(let hero):
                items = hero
            case .failure(let error):
                print(error)
            }
            
        }
    }


}

