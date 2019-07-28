//
//  Coordinator.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class Coordinator {
  
  // MARK: - Properties
  
  private let controllerBuilder: ControllerBuilderProtocol
  lazy private var rootController: UINavigationController = {
    let navigationVC = UINavigationController()
    let phonebookController = controllerBuilder.buildPhonebookController()
        navigationVC.pushViewController(phonebookController, animated: true)
    return navigationVC
}()
  
  // MARK: - Initialization
  
  init(controllerBuilder: ControllerBuilderProtocol) {
    self.controllerBuilder = controllerBuilder
  }
}

// MARK: - CoordinatorProtocol implementation

extension Coordinator: CoordinatorProtocol {
  func getRootController() -> UIViewController {
    return rootController
  }
}

// MARK: - PhonebookPresenterDelegateProtocol implementation

extension Coordinator: PhonebookPresenterDelegateProtocol {
  func show(phoneCard: PhonebookObjectProtocol) {
    let phoneCardController = controllerBuilder.buildPhoneCardController(for: phoneCard)
    self.rootController.pushViewController(phoneCardController, animated: true)
  }
}

// MARK: - PhoneCardPresenterDelegateProtoco implementation

extension Coordinator: PhoneCardPresenterDelegateProtocol {
  func showPhotoWith(url: String) {
    let detailPhotoController = controllerBuilder.buildDetailPhotoController(for: url)
    self.rootController.pushViewController(detailPhotoController, animated: true)
  }
}

// MARK: - DetailPhotoPresenterDelegateProtocol implementation

extension Coordinator: DetailPhotoPresenterDelegateProtocol {
}
