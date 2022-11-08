//
//  HTTPMethod.swift
//  aula15Marvel
//
//  Created by Rogério Tavares on 30/03/22.
//

import Foundation

enum HTTPMethod: String {
    case post
    case put
    case `get`
    case delete
    case patch
    
    public var name: String {
        return rawValue.uppercased()
    }
}
