//
//  ViewController.swift
//  aula11.03
//
//  Created by Rogério Tavares on 22/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     Modelo 1
     var button: UIButton = UIButton()
     */
    
    var safeArea: UILayoutGuide!
    
    lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "airplane")
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.tintColor = .black
        return icon
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo! Olá mundo!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
         Modelo 1
         
         button.frame = CGRect(x: 100, y: 100, width: 130, height: 45)
         button.setTitle("Button view", for: .normal)
         button.backgroundColor = .black
         
         view.addSubview(button)
         */
        
        safeArea = view.layoutMarginsGuide
        
        view.addSubview(iconImageView)
        view.addSubview(titleLabel)
        
        // Criação de constraint 1
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            iconImageView.heightAnchor.constraint(equalToConstant: 80),
            iconImageView.widthAnchor.constraint(equalToConstant: 80),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Criação de constraint 2
        titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        title = "View Controller"
        view.backgroundColor = .gray
    }
    
    
}

