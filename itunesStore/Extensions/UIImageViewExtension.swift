//
//  UIImageViewExtension.swift
//  demo
//
//  Created by Swapnil Raut on 7/26/20.
//  Copyright © 2020 Swapnil Raut. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    /// Helper extension to image view to load image from URL
    /// - Parameters:
    ///   - URLString: Url string input
    ///   - placeHolder: A place holder image in case image is not loaded
  func loadImage(from URLString: String, placeHolder: UIImage?) {
    
    self.image = nil
    if let cachedImage = imageCache.object(forKey: NSString(string: URLString)) {
      self.image = cachedImage
      return
    }
    
    if let url = URL(string: URLString) {
      URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
        if error != nil {
          print("Error loading image: \(error)")
          DispatchQueue.main.async {
            self.image = placeHolder
          }
          return
        }
        DispatchQueue.main.async {
          if let data = data {
            if let downloadedImage = UIImage(data: data) {
              imageCache.setObject(downloadedImage, forKey: NSString(string: URLString))
              self.image = downloadedImage
            }
          }
        }
      }).resume()
    }
  }
}
