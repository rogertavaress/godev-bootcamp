//
//  Constants.swift
//  aula15Marvel
//
//  Created by Rogério Tavares on 30/03/22.
//

import Foundation

struct Constants {
    static let baseURL: String = "https://gateway.marvel.com:443/v1/public/characters"
    static let publicKey: String = "676947c15e8825d365e0e9a208c0b326"
    static let privateKey: String = "38cc93ae0e1d6878021c02baa574515815cfd726"
    static let order: String = "Desc"
    
    static let token: String = UUID().uuidString
}
