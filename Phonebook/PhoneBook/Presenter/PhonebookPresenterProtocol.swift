//
//  PhonebookPresenterProtocol.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol PhonebookPresenterInputProtocol: class {
  var delegate: PhonebookPresenterDelegateProtocol {get set}
  var input: PhonebookInteractorInputProtocol {get set}
  var output: PhonebookViewInputProtocol {get set}
}
protocol PhonebookPresenterDelegateProtocol: class {}
