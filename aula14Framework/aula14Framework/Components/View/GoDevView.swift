//
//  GoDevView.swift
//  aula14Framework
//
//  Created by Rogério Tavares on 29/03/22.
//

import UIKit

public class GoDevView: UIView {

    lazy var textInfo: UILabel = {
        let label = UILabel()
        label.text = "Estou Centralizado"
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public init(bg: UIColor, borderColor: UIColor) {
        super.init(frame: .zero)
        backgroundColor = bg
        self.layer.cornerRadius = 16
        self.layer.borderWidth = 5.0
        self.layer.borderColor = borderColor.cgColor
        translatesAutoresizingMaskIntoConstraints = false
        
        configureTextInfo()
    }
    
    private func configureTextInfo() {
        
        addSubview(textInfo)
        
        NSLayoutConstraint.activate([
            textInfo.centerXAnchor.constraint(equalTo: centerXAnchor),
            textInfo.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
