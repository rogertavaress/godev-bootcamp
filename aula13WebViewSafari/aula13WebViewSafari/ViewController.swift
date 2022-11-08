//
//  ViewController.swift
//  aula13WebViewSafari
//
//  Created by Rogério Tavares on 28/03/22.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("callSafari", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(callSafari), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemIndigo
        
        setupButton()
    }

    private func setupButton() {
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 45),
            button.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2)
        ])
    }
    
    @objc
    private func callSafari() {
        if let url = URL(string: "https://www.rogeriotavares.dev") {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let safariViewController = SFSafariViewController(url: url, configuration: config)
            safariViewController.delegate = self
            safariViewController.preferredControlTintColor = .white
            safariViewController.dismissButtonStyle = .close
            safariViewController.preferredBarTintColor = .black
            present(safariViewController, animated: true)
        }
    }

}


extension ViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true) {
            print("dismiss completion")
        }
    }
    
    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        print("didLoadSuccessfully: \(didLoadSuccessfully)")
    }
}
