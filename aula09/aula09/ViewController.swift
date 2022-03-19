//
//  ViewController.swift
//  aula09
//
//  Created by Rogério Tavares on 17/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func save() {
        let user = User(id: UUID(), name: "Suelen", lastName: "Bezerra", age: 32)
        ManagedObjectContext.shared.save(user) { result in
            print("Result: \(result)")
        }
    }

    @IBAction func delete() {
        guard let id = users.first?.id.uuidString else { return }
        ManagedObjectContext.shared.delete(id: id) { result in
            print("Result: \(result)")
        }
    }
    
    @IBAction func get() {
        users = ManagedObjectContext.shared.getUsers()
        
        print(users)
    }
}

