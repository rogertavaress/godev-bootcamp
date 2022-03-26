//
//  ChatItemTableViewCell.swift
//  desafioWhatsappViewCode
//
//  Created by Rogério Tavares on 25/03/22.
//

import UIKit
import Kingfisher

class ChatItemTableViewCell: UITableViewCell {
    
    static var identifier = "ChatItemTableViewCell"
    
    lazy var photoImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .lightGray
        image.tintColor = .white
        image.contentMode = .center
        image.layer.cornerRadius = 30
        image.makeRounded()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var titleStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = . horizontal
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .darkGray
        label.numberOfLines = 1
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .darkGray
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubViews()
        configureSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews() {
        addSubview(photoImageView)
        addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(titleStackView)
        mainStackView.addArrangedSubview(descriptionLabel)
        
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(dateLabel)
    }
    
    private func configureSubViews() {
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
//            photoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 13),
//            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -13),
            photoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            photoImageView.heightAnchor.constraint(equalToConstant: 60),
            photoImageView.widthAnchor.constraint(equalToConstant: 60),
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            mainStackView.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    public func configure(with model: Chat) {
        
        
        if let image = model.image,
           let url = URL(string: image){
            photoImageView.kf.setImage(with: url)
            photoImageView.kf.setImage(with: url, placeholder: nil, options: nil) { result in
                self.photoImageView.makeRounded()
            }
            photoImageView.contentMode = .scaleAspectFit
        } else {
            photoImageView.image = UIImage(systemName: "person.2.fill")
        }
        
        titleLabel.text = model.name
        descriptionLabel.text = model.lastMessage
        dateLabel.text = model.date
    }
}
