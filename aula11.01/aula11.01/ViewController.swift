//
//  ViewController.swift
//  aula11.01
//
//  Created by Rogério Tavares on 22/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "App 1"
        view.backgroundColor = .orange
    }

    @IBAction func getViewController() {
        let customUrl = "NavigationSchemes://"
        
        if let url = URL(string: customUrl) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
            
        }
    }
}

