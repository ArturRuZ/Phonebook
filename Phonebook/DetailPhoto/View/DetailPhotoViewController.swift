//
//  DetailPhotoViewController.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class DetailPhotoViewController: UIViewController {
  private var viewOutput: DetailPhotoViewOutputProtocol!
  
}

// MARK: - Implementatin UITableViewDataSource

extension DetailPhotoViewController: DetailPhotoViewInputProtocol {
  var output: DetailPhotoViewOutputProtocol {
    get {
      return self.viewOutput
    }
    set {
      self.viewOutput = newValue
    }
  }
}
