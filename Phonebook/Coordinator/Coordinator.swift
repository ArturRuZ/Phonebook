//
//  Coordinator.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class Coordinator {
  
  // MARK: - Private properties
  
  private let controllerBuilder: ControllerBuilderProtocol
  lazy private var rootController: UIViewController = controllerBuilder.buildRootController()
  
  // MARK: - Initialization
  
  init(controllerBuilder: ControllerBuilderProtocol) {
    self.controllerBuilder = controllerBuilder
  }
  
  // MARK: - Private methods
  
}

// MARK: - CoordinatorProtocol implementation

extension Coordinator: CoordinatorProtocol {
  func getRootController() -> UIViewController {
    return rootController
  }
}

// MARK: - CoordinatorProtocol implementation

extension Coordinator: PhonebookPresenterDelegateProtocol {
  
}
