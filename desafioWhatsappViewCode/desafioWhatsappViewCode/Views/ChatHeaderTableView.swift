//
//  HeaderChatTableView.swift
//  desafioWhatsappViewCode
//
//  Created by Rogério Tavares on 25/03/22.
//

import Foundation
import UIKit

class ChatHeaderTableView: UITableViewHeaderFooterView {
    
    static let identifier = "ChatHeaderTableView"
    
    lazy var transmissionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Listas de transmissão", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var newGroupButton: UIButton = {
        let button = UIButton()
        button.setTitle("Novo grupo", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        addSubViews()
        configureSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews() {
        contentView.addSubview(transmissionButton)
        contentView.addSubview(newGroupButton)
    }
    
    private func configureSubViews() {
        NSLayoutConstraint.activate([
            transmissionButton.heightAnchor.constraint(equalToConstant: 40),
            transmissionButton.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 0),
            newGroupButton.heightAnchor.constraint(equalToConstant: 40),
            newGroupButton.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 0)
        ])
    }
}

