//
//  PhonebookCellProtocol.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

protocol PhonebookCellProtocol {
  var photoUrl: String {get}
  func getFullName() -> String
}
