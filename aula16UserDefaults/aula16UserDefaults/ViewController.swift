//
//  ViewController.swift
//  aula16UserDefaults
//
//  Created by Rogério Tavares on 04/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let defaults = UserDefaults.standard
    
    lazy var setValueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Set Value", for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(setUserDefaults), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var getValueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get Value", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(getUserDefaults), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemIndigo
        
        view.addSubview(setValueButton)
        view.addSubview(getValueButton)
        
        NSLayoutConstraint.activate([
            setValueButton.heightAnchor.constraint(equalToConstant: 45),
            setValueButton.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            setValueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            setValueButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            getValueButton.heightAnchor.constraint(equalToConstant: 45),
            getValueButton.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            getValueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getValueButton.topAnchor.constraint(equalTo: setValueButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc
    func setUserDefaults() {
        defaults.set("Sport Recife", forKey: "time")
        defaults.set(true, forKey: "melhor_do_mundo")
    }

    @objc
    func getUserDefaults() {
        if let time = defaults.value(forKey: "time") {
            print(time)
        }
        
        if let luvaDePedreiro = defaults.value(forKey: "melhor_do_mundo") as? Bool {
            print(luvaDePedreiro)
        }
    }
}

