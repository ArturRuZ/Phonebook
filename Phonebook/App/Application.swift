//
//  Application.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class Application {
  
  // MARK: - Private properties
  
  private let modulesCoordinator: CoordinatorProtocol = {
    let internetService = InternetService()
    let controllerBuilder: ControllerBuilderProtocol = ControllerBuilder(internetService: internetService)
    let modulesCoordinator: CoordinatorProtocol = Coordinator(controllerBuilder: controllerBuilder)
    controllerBuilder.cordinator = modulesCoordinator
    return modulesCoordinator
  }()
  
  // MARK: - BuildIn Methods
  
  func rootViewController() -> UIViewController {
    return self.modulesCoordinator.getRootController()
  }
}
