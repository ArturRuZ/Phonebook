//
//  PhoneCardInteractor.swift
//  PhoneCard
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

final class PhoneCardInteractor {
  
  // MARK: - Properties
  
  weak var interactorOutput: PhoneCardInteractorOutputProtocol!
  private var currenPhoneCard: PhonebookObjectProtocol?
}

// MARK: - PhoneCardInteractorInputProtocol implementation

extension PhoneCardInteractor: PhoneCardInteractorInputProtocol {
  var output: PhoneCardInteractorOutputProtocol {
    get {
      return interactorOutput
    }
    set {
      interactorOutput = newValue
    }
  }

  func save(phoneCard: PhonebookObjectProtocol) {
    self.currenPhoneCard = phoneCard
  }
  func downloadPhoneCard() {
    guard let phoneCard = currenPhoneCard else { return }
    self.interactorOutput.prepareForShow(phoneCard: phoneCard)
  }
}
