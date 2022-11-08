//
//  ViewController.swift
//  desafioLoginViewCode
//
//  Created by Rogério Tavares on 23/03/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    var safeArea: UILayoutGuide!
    
    lazy var containerStackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.backgroundColor = .orange
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "applelogo")
        image.backgroundColor = .red
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var logoImageView2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "applelogo")
        image.backgroundColor = .red
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    lazy var logoImageView3: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "applelogo")
        image.backgroundColor = .red
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        addSubViews()
        configureContainerStackView()
        configureLogoImageView()
    }
    
    private func configureView() {
        view.backgroundColor = .systemIndigo
        safeArea = view.layoutMarginsGuide
    }
    
    private func addSubViews() {
        view.addSubview(containerStackView)
        containerStackView.addSubview(logoImageView)
        containerStackView.addSubview(logoImageView2)
        containerStackView.addSubview(logoImageView3)
    }
    
    private func configureContainerStackView() {
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
//            containerStackView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
//            containerStackView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor)
        ])
    }
    
    private func configureLogoImageView() {
        NSLayoutConstraint.activate([
            logoImageView.heightAnchor.constraint(equalToConstant: 80),
            logoImageView.widthAnchor.constraint(equalToConstant: 80)
        ])
    }


}

