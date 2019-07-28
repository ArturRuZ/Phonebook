//
//  PhoneCardProtocol.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol PhoneCardViewOutputProtocol: class {
  func viewDidLoad()
  func personPhotoSelectedWith(url: String)
  func callButtonPressed()
}

protocol PhoneCardViewInputProtocol: class {
  var output: PhoneCardViewOutputProtocol {get set}
  func show(phoneCard: PhonebookObjectProtocol)
}
