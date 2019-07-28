//
//  PhoneCardPresenterProtocol.swift
//  PhoneCard
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol PhoneCardPresenterInputProtocol: class {
  var delegate: PhoneCardPresenterDelegateProtocol {get set}
  var input: PhoneCardInteractorInputProtocol {get set}
  var output: PhoneCardViewInputProtocol {get set}
  func prepare(phoneCard: PhonebookObjectProtocol)
}
protocol PhoneCardPresenterDelegateProtocol: class {
  func showPhotoWith(url: String)
}
