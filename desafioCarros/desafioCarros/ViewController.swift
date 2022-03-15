//
//  ViewController.swift
//  desafioCarros
//
//  Created by Rogério Tavares on 14/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageListCollectionView: UICollectionView!
    @IBOutlet weak var carImageView: UIImageView!
    
    var cars = ["1", "2", "3", "4", "5", "6", "7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate()
        registerNibs()
        configureLayout()
        configureCollectionView()
        configureImage()
    }
    
    private func delegate() {
        imageListCollectionView.delegate = self
        imageListCollectionView.dataSource = self
    }
    
    private func registerNibs() {
        let nib = UINib(nibName: CarImageCollectionViewCell.identifier, bundle: nil)
        imageListCollectionView.register(nib, forCellWithReuseIdentifier: CarImageCollectionViewCell.identifier)
    }
    
    private func configureLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        layout.itemSize.width = (view.frame.width / 2)
        layout.itemSize.height = 200
        imageListCollectionView.collectionViewLayout = layout
    }
    
    private func configureCollectionView() {
        imageListCollectionView.showsHorizontalScrollIndicator = false
    }
    
    private func configureImage() {
        carImageView.image = UIImage(named: "1")
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = cars[indexPath.row]
        
        carImageView.image = UIImage(named: image)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let carImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CarImageCollectionViewCell.identifier, for: indexPath) as? CarImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        let image = cars[indexPath.row]
        
        carImageCollectionViewCell.setup(imageName: image)
        
        return carImageCollectionViewCell
    }
}
