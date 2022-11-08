//
//  UIView+extensions.swift
//  aula11.03
//
//  Created by Rogério Tavares on 23/03/22.
//

import UIKit

extension UIView {
    func addSubViews(_ subviews: UIView...) {
        subviews.forEach { view in
            self.addSubview(view)
        }
    }
}
