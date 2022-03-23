//
//  ViewController.swift
//  aula11
//
//  Created by Rogério Tavares on 22/03/22.
//

import UIKit
import StoreKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "App 2"
        
        view.backgroundColor = .systemIndigo
    }

    @IBAction func getFacebook() {
        let schemes = "fb://"
        
        if let url = URL(string: schemes) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    @IBAction func getWhatsApp() {
        let schemes = "whatsapp://"
        
        if let url = URL(string: schemes) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    @IBAction func getNumberPhone() {
        let schemes = "tel://+55(81)998663807"
        
        if let url = URL(string: schemes) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    @IBAction func getSMS() {
        let schemes = "sms://+55(81)998663807"
        
        if let url = URL(string: schemes) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    @IBAction func getEmail() {
        if MFMailComposeViewController.canSendMail() {
            
        }
    }
}

extension ViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailCompose)
}
