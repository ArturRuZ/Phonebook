//
//  PhoneCardEmailCellView.swift
//  Phonebook
//
//  Created by Артур on 28/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class PhoneCardEmailCellView: UITableViewCell {

   // MARK: - Outlets
  
  @IBOutlet weak var emailLabel: UILabel!
  
  // MARK: - Confegure PhoneCardEmailCellView:
  
  var phoneCardEmailCellModel: PhoneCardEmailCellProtocol? {
    didSet {
      guard let phoneCardEmailCellModel = phoneCardEmailCellModel else { return }
      self.emailLabel.text = phoneCardEmailCellModel.email
    }
  }
}
