//
//  UIImageView.swift
//  POCApp
//
//  Created by Kavita Patil on 30/04/20.
//  Copyright © 2020 Kavita Patil. All rights reserved.
//

import Foundation
import UIKit
let imageCache = NSCache<NSString, UIImage>()
extension UIImageView {
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  
        guard let url = URL(string: link) else { return }
        // downloaded(from: url, contentMode: mode)
        
        // set initial image to nil so it doesn't use the image from a reused cell
        image = nil
        
        // check if the image is already in the cache
        if let imageToCache = imageCache.object(forKey: link as NSString) {
            self.image = imageToCache
            return
        }
        // download the image asynchronously
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil
                else { return }
            
            DispatchQueue.main.async {
                // create UIImage
                let imageToCache = UIImage(data: data)
                // add image to cache
                if let imageToCache = imageToCache {
                    imageCache.setObject(imageToCache, forKey: link as NSString)
                }
                self.image = imageToCache
            }
        }
        .resume()
        return
    }
}
