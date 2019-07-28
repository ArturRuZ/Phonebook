//
//  PhoneCardInteractorProtocol.swift
//  PhoneCard
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol  PhoneCardInteractorInputProtocol: class {
  var output: PhoneCardInteractorOutputProtocol {get set}
  func save(phoneCard: PhonebookObjectProtocol)
  func downloadPhoneCard()
}

protocol  PhoneCardInteractorOutputProtocol: class {
  func prepareForShow(phoneCard: PhonebookObjectProtocol)
}
