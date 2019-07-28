//
//  DetailPhotoViewController.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class DetailPhotoViewController: UIViewController {
 
  // MARK: - Outlets
  
  @IBOutlet weak var detailPersonUIImage: UIImageView!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
   // MARK: - Properties
  
  private var viewOutput: DetailPhotoViewOutputProtocol!
 
  // MARK: - BuildIn methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpUI()
    viewOutput.viewDidLoad()
  }
  
  // MARK: - Private methods
  
  private func setUpUI() {
    self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem.init(
      title: "Back", style: .plain, target: nil, action: nil)
     self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
     self.navigationController?.navigationBar.shadowImage = UIImage()
  }
}

// MARK: - Implementation UITableViewDataSource

extension DetailPhotoViewController: DetailPhotoViewInputProtocol {
  var output: DetailPhotoViewOutputProtocol {
    get {
      return self.viewOutput
    }
    set {
      self.viewOutput = newValue
    }
  }
  func showPhotoWith(url: String) {
    self.detailPersonUIImage.loadImageUsingCache(withUrl: url, activityIndicator: self.activityIndicator)
  }
}
