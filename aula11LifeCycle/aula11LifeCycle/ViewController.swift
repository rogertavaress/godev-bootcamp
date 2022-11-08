//
//  ViewController.swift
//  aula11LifeCycle
//
//  Created by Rogério Tavares on 24/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func loadView() {
        super.loadView()
        
        print("loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("viewDidDisappear")
    }

    @IBAction func getView(_ sender: UIButton) {
        
        performSegue(withIdentifier: "segueUserView", sender: nil)
    }
}

