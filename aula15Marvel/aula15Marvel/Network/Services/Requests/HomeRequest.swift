//
//  HomeRequest.swift
//  aula15Marvel
//
//  Created by Rogério Tavares on 30/03/22.
//

import Foundation

enum HomeRequest: URLRequestProtocol {
    case home
    case details
    
    var baseURL: String {
        return Environment.baseURL
    }
    
    var path: String {
        
        /*
         Hash
         
         MD5 = timestamp + public + private
         */
        
        let timestamp = NSData().timeIntervalSince1970.descriptor
        
        switch self {
        case .home:
            return "limit=30&apiKey=\(Environment.publicKey)&hash=\(hashMD5(timestamp: timestamp))"
        case .details:
            return "details=1"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .home:
            return .get
        case .details:
            return .post
        }
    }
    
    
}
