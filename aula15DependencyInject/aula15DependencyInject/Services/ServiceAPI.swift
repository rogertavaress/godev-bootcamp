//
//  ServicesAPI.swift
//  aula15DependencyInject
//
//  Created by Rogério Tavares on 30/03/22.
//

import Foundation
import UIKit

enum UserError: Error {
    case error(String)
    case urlInvalid
    case noDataAvailable
    case noProcessData
}

typealias ServiceAPICompletion = (Result<[User], UserError>) -> Void

protocol ServiceAPIProtocol: AnyObject {
    func getUsers(completion: @escaping ServiceAPICompletion)
}

class ServiceAPI: ServiceAPIProtocol {
    func getUsers(completion: @escaping ServiceAPICompletion) {
        let users = [User(name: "Roger", email: "rogerioctf@gmail.com")]
        
        completion(.success(users))
    }
}
