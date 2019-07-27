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
  var smallPhoto: UIImage
  var largePhoto: UIImage
  
  // MARK: - Init
  
  init(firstName: String,patronymic: String = "", lastName: String, email: String, phone: String, smallPhoto: UIImage, largePhoto: UIImage) {
    self.firstName = firstName
    self.patronymic = patronymic
    self.lastName = lastName
    self.email = email
    self.phone = phone
    self.smallPhoto = smallPhoto
    self.largePhoto = largePhoto
  }
  
}
