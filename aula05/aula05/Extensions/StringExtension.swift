//
//  StringExtension.swift
//  aula05
//
//  Created by Rogério Tavares on 11/03/22.
//

extension String {
    func validate(_ type: StringValidateEnum) -> Bool {
        let regex: String
        
        switch type {
        case .email:
            regex = #"^\S+@\S+\.\S+$"#
        case .password:
            regex =
            // At least 8 characters
            #"(?=.{8,})"# +
            
            // At least one capital letter
            #"(?=.*[A-Z])"# +
            
            // At least one lowercase letter
            #"(?=.*[a-z])"# +
            
            // At least one digit
            #"(?=.*\d)"# +
            
            // At least one special character
            #"(?=.*[ !$%&?._-])"#
        }
        
        guard let _ = range(
            of: regex,
            options: .regularExpression
        ) else {
            return false
        }
        
        return true
    }
}
