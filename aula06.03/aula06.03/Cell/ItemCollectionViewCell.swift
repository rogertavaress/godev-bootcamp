//
//  ItemCollectionViewCell.swift
//  aula06.03
//
//  Created by Rogério Tavares on 14/03/22.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageLogo: UIImageView!
    
    static let identifier = "ItemCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        contentView.backgroundColor = .orange
        contentView.tintColor = .white
    }
    
    func setup(image: String) {
        guard let image = UIImage(systemName: image) else {
            imageLogo.image = UIImage(systemName: "appleLogo")
            return
        }
        
        imageLogo.image = image
    }

}
