//
//  ViewController.swift
//  aula05
//
//  Created by Rogério Tavares on 11/03/22.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var authButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        authButton.layer.cornerRadius = 10
        
        delegates()
    }
    
    private func delegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    @IBAction func autenticar(_ sender: Any) {
        guard
            let email = emailTextField.text,
            let pass = passwordTextField.text
        else {
            createAuthAlert(isSuccess: false)
            return
        }
        
        let emailValidate = email.validate(.email)
        let passValidate = pass.validate(.password)
        
        if !emailValidate || !passValidate {
            createAuthAlert(isSuccess: false)
            return
        }
        
        AuthService.execute(email: email, password: pass) { isSuccess in
            createAuthAlert(isSuccess: isSuccess)
        }
    }
    
}

extension LoginController {
    func createAuthAlert(isSuccess: Bool) {
        let title: String
        let message: String
        
        if isSuccess {
            title = "Autenticado"
            message = "Login efetuado com sucesso!"
        } else {
            title = "Falha"
            message = "Ops, tivemos uma falha"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Fechar", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}

extension LoginController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
