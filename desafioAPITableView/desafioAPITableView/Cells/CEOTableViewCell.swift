//
//  CEOTableViewCell.swift
//  desafioAPITableView
//
//  Created by Rogério Tavares on 21/03/22.
//

import UIKit
import Kingfisher

class CEOTableViewCell: UITableViewCell {
    
    static let identifier = "CEOTableViewCell"

    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoImageView.makeRounded()
    }

    func configure(with model: CEOModel) {
        titleLabel.text = model.name
        descriptionLabel.text = model.company.name
        
        if let url = URL(string: model.photo) {
            photoImageView.kf.setImage(with: url)
        }
        
    }
    
}
