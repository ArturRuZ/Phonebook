//
//  PhonebookInteractor.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

final class PhonebookInteractor {
  
  // MARK: - Properties
  
  weak var interactorOutput: PhonebookInteractorOutputProtocol!
  private let internetService: InternetServiceProtocol

  
  // MARK: - Initialization
  
  init(internetService: InternetServiceProtocol) {
    self.internetService = internetService
  }
  
  // MARK: - Private methods
  

}

// MARK: - PhonebookInteractorInputProtocol implementation

extension PhonebookInteractor: PhonebookInteractorInputProtocol {
  var output: PhonebookInteractorOutputProtocol {
    get {
      return interactorOutput
    }
    set {
      interactorOutput = newValue
    }
  }
}
