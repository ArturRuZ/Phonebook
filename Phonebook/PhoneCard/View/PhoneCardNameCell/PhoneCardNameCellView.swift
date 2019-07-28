//
//  PhoneCardNameCellView.swift
//  Phonebook
//
//  Created by Артур on 28/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class PhoneCardNameCellView: UITableViewCell {
 
  // MARK: - Outlets
  
  @IBOutlet weak var fullPersonNameLabel: UILabel!
  @IBOutlet weak var personPhotoImage: UIImageView!
  @IBOutlet weak var personPhoneNumberLabel: UILabel!
  @IBAction func callButton(_ sender: Any) {
    guard let delegate = self.delegate else { return }
    delegate.callButtonPressed()
  }
  
  // MARK: - Properties
  
  weak var delegate: PhoneCardNameCellDelegateProtocol?
  
  // MARK: - Confegure PhoneCardNameCell
  
  var phoneCardCellModel: PhoneCardNameCellProtocol? {
    didSet {
      guard let phoneCardCellModel = phoneCardCellModel else { return }
      self.fullPersonNameLabel.lineBreakMode = .byWordWrapping
      let fullName = phoneCardCellModel.getFullName()
      self.fullPersonNameLabel.numberOfLines = fullName.components(separatedBy: "\n").count + 10
      self.fullPersonNameLabel.text = fullName
      self.personPhotoImage.layer.cornerRadius = 30
      self.personPhoneNumberLabel.text = phoneCardCellModel.phone
      self.personPhotoImage.loadImageUsingCache(withUrl: phoneCardCellModel.photoUrl)
      let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(openPersonPhoto))
      personPhotoImage.addGestureRecognizer(tapRecognizer)
      personPhotoImage.isUserInteractionEnabled = true
    }
  }
  
  // MARK: - @objc methods Implementation
  
  @objc func openPersonPhoto(sender: UIGestureRecognizer) {
    guard let delegate = self.delegate else { return }
    delegate.personPhotoSelected()
  }
}

