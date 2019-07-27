//
//  PhonecardInteractor.swift
//  Phonecard
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

final class PhonecardInteractor {
  
  // MARK: - Properties
  
  weak var interactorOutput: PhonecardInteractorOutputProtocol!

  // MARK: - Private methods
}

// MARK: - PhonecardInteractorInputProtocol implementation

extension PhonecardInteractor: PhonecardInteractorInputProtocol {
  var output: PhonecardInteractorOutputProtocol {
    get {
      return interactorOutput
    }
    set {
      interactorOutput = newValue
    }
  }
}
