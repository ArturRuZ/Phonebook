//
//  ControllerBuilder.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class ControllerBuilder {
  
  // MARK: - Private properties
  
  private let internetService: InternetServiceProtocol
  private weak var modulesCoordinator: CoordinatorProtocol!

  
  // MARK: - Initialization
  
  init(internetService: InternetServiceProtocol) {
    self.internetService = internetService
  }
  
  // MARK: - Private methods
}

// MARK: - ControllerBuilderProtocol implementation

extension ControllerBuilder: ControllerBuilderProtocol {
  var cordinator: CoordinatorProtocol {
    get {
      return self.modulesCoordinator
    }
    set {
      self.modulesCoordinator = newValue
    }
  }
 
  func buildRootController() -> UIViewController {
   return UIViewController()
  }
}
