//
//  CustomTableViewCell.swift
//  aula06.02
//
//  Created by Rogério Tavares on 14/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup(logo: String, name: String, description: String) {
        logoImageView.image = UIImage(systemName: logo)
        nameLabel.text = name
        descriptionLabel.text = description
    }
}
