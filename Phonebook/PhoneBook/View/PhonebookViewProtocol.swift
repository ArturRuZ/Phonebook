//
//  PhonebookViewProtocol.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

protocol PhonebookViewOutputProtocol: class {
  func viewDidLoad()
  func textInputInSearchBar(textForSearch: String)
  func searchingEnding()
  func rowSelected(record: PhonebookObjectProtocol)
}

protocol PhonebookViewInputProtocol: class {
  var output: PhonebookViewOutputProtocol {get set}
  func show(phonebook: [PhonebookObjectProtocol])
  func show(alert: UIAlertController)
}
