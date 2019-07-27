//
//  PhonebookObject.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class PhonebookObject: PhonebookObjectProtocol {
  
  // MARK: - Properties
  
  var firstName: String
  var patronymic: String
  var lastName: String
  var email: String
  var phone: String
  var smallPhotoUrl: String
  var largePhotoUrl: String
  
  // MARK: - Init
  
  init(firstName: String,patronymic: String = "", lastName: String, email: String, phone: String, smallPhotoUrl: String, largePhotoUrl: String) {
    self.firstName = firstName
    self.patronymic = patronymic
    self.lastName = lastName
    self.email = email
    self.phone = phone
    self.smallPhotoUrl = smallPhotoUrl
    self.largePhotoUrl = largePhotoUrl
  }
  
  // MARK: - Methods
  
  func getFullName() -> String {
    return "\(firstName) " + "\(patronymic)" + "\(lastName)"
  }
}

// MARK: - PhonebookCellProtocol Implementation

extension PhonebookObject: PhonebookCellProtocol {
  var photoUrl: String {
    return self.smallPhotoUrl
  }
}
