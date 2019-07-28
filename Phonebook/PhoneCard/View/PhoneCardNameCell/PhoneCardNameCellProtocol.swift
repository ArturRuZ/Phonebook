//
//  PhoneCardNameCellProtocol.swift
//  Phonebook
//
//  Created by Артур on 28/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol PhoneCardNameCellProtocol: class {
  var photoUrl: String {get}
  var phone: String {get}
  func getFullName() -> String
}
