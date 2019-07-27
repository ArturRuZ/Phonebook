//
//  Phonebook.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol  PhonebookInteractorInputProtocol: class {
  var output: PhonebookInteractorOutputProtocol {get set}
}

protocol  PhonebookInteractorOutputProtocol: class {
}