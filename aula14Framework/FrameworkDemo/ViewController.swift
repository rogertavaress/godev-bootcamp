//
//  ViewController.swift
//  FrameworkDemo
//
//  Created by Rogério Tavares on 29/03/22.
//

import UIKit
import aula14Framework

class ViewController: UIViewController {
    
    lazy var button: GoDevButton = {
        let config = GoDevButton.Config.dark()
        let button = GoDevButton(config: config)
        button.setTitle("Favorite", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Demo"
        view.backgroundColor = .white
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


}

