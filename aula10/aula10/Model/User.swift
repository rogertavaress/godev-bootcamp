//
//  User.swift
//  aula10
//
//  Created by Rogério Tavares on 18/03/22.
//

import Foundation

struct User: Codable {
    let id: Int
    let name, username, email: String
    let address: Address?
    let phone: String
    let company: Company
}

struct Address: Codable {
    let street, city, zipcode: String?
}

struct Company: Codable {
    let name: String
}
