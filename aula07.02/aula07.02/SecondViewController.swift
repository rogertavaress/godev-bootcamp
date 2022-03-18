//
//  SecondViewController.swift
//  aula07.02
//
//  Created by Rogério Tavares on 15/03/22.
//

import UIKit

class SecondViewController: UIViewController {

    var property: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "SecondViewController"
        
        if let property = property {
            print("Esse é o valor: \(property.name) e \(property.age)")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
