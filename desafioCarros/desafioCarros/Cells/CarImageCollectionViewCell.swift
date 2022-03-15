//
//  CarImageCollectionViewCell.swift
//  desafioCarros
//
//  Created by Rogério Tavares on 14/03/22.
//

import UIKit

class CarImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var carImageView: UIImageView!
    
    static let identifier = "CarImageCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(imageName: String) {
        if let image = UIImage(named: imageName) {
            carImageView.image = image
        }
    }
}
