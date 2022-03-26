//
//  UIImageView+extensions.swift
//  desafioWhatsappViewCode
//
//  Created by Rogério Tavares on 25/03/22.
//

import UIKit

extension UIImageView {
    func makeRounded() {
            self.layer.borderWidth = 0
            self.layer.masksToBounds = false
            self.layer.cornerRadius = self.frame.height / 2
            self.clipsToBounds = true
        }
}

