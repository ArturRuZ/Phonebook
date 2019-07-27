//
//  PhonebookViewProtocol.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol PhonebookViewOutputProtocol: class {
}

protocol PhonebookViewInputProtocol: class {
  var output: PhonebookViewOutputProtocol {get set}
}
