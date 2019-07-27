//
//  PhonebookObjectProtocol.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

protocol PhonebookObjectProtocol: class {
  var firstName: String {get}
  var patronymic: String {get}
  var lastName: String {get}
  var email: String {get}
  var phone: String {get}
  var smallPhotoUrl: String {get}
  var largePhotoUrl: String {get}
  func getFullName() -> String 
}
