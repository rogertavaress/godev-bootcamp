//
//  UIImageView+extensions.swift
//  trackMusic
//
//  Created by Douglas  Goulart Nunes on 11/09/19.
//  Copyright © 2019 Douglas Nunes. All rights reserved.
//

import UIKit

extension UIImageView {
  
    func loadImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

        let cache =  URLCache.shared
        let request = URLRequest(url: imageURL)
      
        DispatchQueue.global(qos: .userInitiated).async {
            if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.transition(toImage: image)
                }
            } else {
                URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                    if let data = data, let response = response, ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300, let image = UIImage(data: data) {
                        let cachedData = CachedURLResponse(response: response, data: data)
                        cache.storeCachedResponse(cachedData, for: request)
                        DispatchQueue.main.async {
                            self.transition(toImage: image)
                        }
                    }
                }).resume()
            }
        }
    }
  
    func transition(toImage image: UIImage?) {
        UIView.transition(with: self, duration: 0.2,
                          options: [.transitionCrossDissolve],
                          animations: {
                            self.image = image
        },
                          completion: nil)
    }
    
    func makeRounded() {
            self.layer.borderWidth = 0
            self.layer.masksToBounds = false
            self.layer.cornerRadius = self.frame.height / 2
            self.clipsToBounds = true
        }
}

