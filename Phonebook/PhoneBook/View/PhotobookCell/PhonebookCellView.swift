//
//  PhotobookCellView.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

class PhonebookCellView: UITableViewCell {

  // MARK: - Outlets
  
  @IBOutlet weak var fullPersonNameLabel: UILabel!
  @IBOutlet weak var personPhotoImage: UIImageView!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  // MARK: - Confegure PhonebookCellView
  
  var phonebookCellModel: PhonebookCellProtocol? {
    didSet {
      guard let phonebookCellModel = phonebookCellModel else { return }
      self.fullPersonNameLabel.lineBreakMode = .byWordWrapping
      let fullName = phonebookCellModel.getFullName()
      self.fullPersonNameLabel.numberOfLines = fullName.components(separatedBy: "\n").count + 10
      self.fullPersonNameLabel.text = fullName
      self.personPhotoImage.layer.cornerRadius = 30
      self.personPhotoImage.loadImageUsingCache(withUrl: phonebookCellModel.photoUrl, activityIndicator: activityIndicator)
    }
  }
}
