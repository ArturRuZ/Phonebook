//
//  Phonebook.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

protocol  PhonebookInteractorInputProtocol: class {
  var output: PhonebookInteractorOutputProtocol {get set}
  func downloadPhonebook()
  func findBy(_ fio: String)
  func endSearch()
}

protocol  PhonebookInteractorOutputProtocol: class {
  func prepareForShow(phonebook: [PhonebookObjectProtocol])
  func prepare(alert: UIAlertController)
}
