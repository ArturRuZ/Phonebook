//
//  UIimageViewDownloadExtension.swift
//  Phonebook
//
//  Created by Артур on 27/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

// MARK: - Helper method to download UIImageView image

let imageCache = NSCache<NSString, AnyObject>()

extension UIImageView {
  func loadImageUsingCache(withUrl url : String, activityIndicator: UIActivityIndicatorView? = nil) {
    activityIndicator?.startAnimating()
    guard let urlForDownload = URL(string: url) else { return }
    self.image = nil
    if let cachedImage = imageCache.object(forKey: url as NSString) as? UIImage {
      activityIndicator?.stopAnimating()
      self.image = cachedImage
      return
    }
    URLSession.shared.dataTask(with: urlForDownload, completionHandler: { (data, response, error) in
      if error != nil {
        print(error!)
        return
      }
      guard let data = data, let image = UIImage(data: data) else { return }
      DispatchQueue.main.async {
        imageCache.setObject(image, forKey: url as NSString)
        activityIndicator?.stopAnimating()
        self.image = image
      }
    }).resume()
  }
}
