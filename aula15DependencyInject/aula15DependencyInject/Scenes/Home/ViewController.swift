//
//  ViewController.swift
//  aula15DependencyInject
//
//  Created by Rogério Tavares on 30/03/22.
//

import UIKit

class ViewController: UIViewController {

    // Modo 1
    let api = ServiceAPI()
    
    // Modo 2
//    private let userApi: ServiceAPI
    
    // Modo 3
    private let userApi: ServiceAPIProtocol
    
    init(userApi: ServiceAPIProtocol) {
        self.userApi = userApi
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemIndigo
        
        userApi.getUsers { result in
            switch result {
            case .success(let users):
                print("Users: \(users)")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }


}

