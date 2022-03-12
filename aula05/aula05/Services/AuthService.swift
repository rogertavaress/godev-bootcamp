//
//  AuthService.swift
//  aula05
//
//  Created by Rogério Tavares on 11/03/22.
//

import Foundation

class AuthService {
    static func execute(email: String, password: String, completionHandler: (_ isSuccess: Bool) -> Void) {
        let correctEmail = "email@rogeriotavares.dev"
        let correctPass = "$tr0ngPa$$w0rd"
        
        let response = correctEmail == email && correctPass == password
        completionHandler(response)
    }
}
