//
//  PhonecardProtocol.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol PhonecardViewOutputProtocol: class {
}

protocol PhonecardViewInputProtocol: class {
  var output: PhonecardViewOutputProtocol {get set}
}
