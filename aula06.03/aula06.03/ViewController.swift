//
//  ViewController.swift
//  aula06.03
//
//  Created by Rogério Tavares on 14/03/22.
//

import UIKit

class ViewController: UIViewController  {
    
    let icons = ["keyboard", "pencil", "rectangle.and.pencil.and.ellipsis", "pencil.and.outline", "globe.americas"]

    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        registerCell()
        collectionLayout()
        
        collection.showsHorizontalScrollIndicator = false
    }

    private func delegates() {
        collection.delegate = self
        collection.dataSource = self
    }
    
    private func registerCell() {
        let nib = UINib(nibName: ItemCollectionViewCell.identifier, bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
    }
    
    private func collectionLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 90, height: 90)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        
        collection.collectionViewLayout = layout
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Eu cliquei no icone: \(icons[indexPath.row])")
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return icons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let icon = icons[indexPath.row]
        
        cell.setup(image: icon)
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
}
