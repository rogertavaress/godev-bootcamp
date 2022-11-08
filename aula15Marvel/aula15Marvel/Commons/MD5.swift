//
//  MD5.swift
//  aula15Marvel
//
//  Created by Rogério Tavares on 30/03/22.
//

import Foundation

func hashMD5(timestamp: String) -> String {
    let hash = "\(timestamp)\(Environment.privateKey)\(Environment.publicKey)"
    
    return hash
}
