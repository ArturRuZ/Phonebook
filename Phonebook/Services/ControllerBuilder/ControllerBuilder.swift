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
  private let searchService: SearchServiceProtocol
  private weak var modulesCoordinator: CoordinatorProtocol!

  
  // MARK: - Initialization
  
  init(internetService: InternetServiceProtocol, searchService: SearchServiceProtocol) {
    self.internetService = internetService
    self.searchService = searchService
  }
  
  // MARK: - Private methods
  
  private func createPhonebookController() -> (UIViewController) {
    let assembly = PhonebookAssembly()
    guard let phonebookModule = assembly.build(internetService: self.internetService, searchService: self.searchService) else { return UIViewController() }
    guard let cordinator = modulesCoordinator as? PhonebookPresenterDelegateProtocol else { return UIViewController() }
    let navigationVC = UINavigationController()
    phonebookModule.controller.navigationItem.title = "Phonebook"
    navigationVC.pushViewController(phonebookModule.controller, animated: true)
    phonebookModule.presenter.delegate = cordinator
    return navigationVC
  }
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
   return createPhonebookController()
  }
}
