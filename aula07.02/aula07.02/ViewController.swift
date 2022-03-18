//
//  ViewController.swift
//  aula07.02
//
//  Created by Rogério Tavares on 15/03/22.
//

import UIKit

struct Data {
    var name: String
    var age: Int
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "FirstViewController"
    }

    @IBAction func secondView(_ sender: UIButton) {
        let sender = Data(name: "Roger", age: 25)
        
        performSegue(withIdentifier: "secondViewController", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondViewController" {
            
            if let secondViewController = segue.destination as? SecondViewController {
                secondViewController.property = sender as? Data
            }
            
        }
    }
    
}

