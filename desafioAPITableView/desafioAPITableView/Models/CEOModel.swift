//
//  CEOModel.swift
//  desafioAPITableView
//
//  Created by Rogério Tavares on 21/03/22.
//

import Foundation

struct CEOModel: Codable {
    let id: Int
    let name: String
    let photo: String
    let company: Company
}

struct Company: Codable {
    let name: String
}
