//
//  ControllerBuilder.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class ControllerBuilder {
  
  // MARK: - Properties
  
  private let internetService: InternetServiceProtocol
  private let searchService: SearchServiceProtocol
  private weak var coordinator: CoordinatorProtocol!

  // MARK: - Initialization
  
  init(internetService: InternetServiceProtocol, searchService: SearchServiceProtocol) {
    self.internetService = internetService
    self.searchService = searchService
  }
  
  // MARK: - Private methods
  
  private func createPhonebookController() -> (UIViewController) {
    let assembly = PhonebookAssembly()
    guard let delegate = coordinator as? PhonebookPresenterDelegateProtocol else { return UIViewController() }
    guard let phonebookModule = assembly.build(internetService: self.internetService, searchService: self.searchService, delegate: delegate) else { return UIViewController() }
    phonebookModule.controller.navigationItem.title = "Phonebook"
    return phonebookModule.controller
  }
  private func createPhoneCardController(for card: PhonebookObjectProtocol) -> UIViewController {
    let assembly = PhoneCardAssembly()
    guard let delegate = coordinator as? PhoneCardPresenterDelegateProtocol else { return UIViewController() }
    guard let phoneCardModule = assembly.build(delegate: delegate) else { return UIViewController() }
    phoneCardModule.presenter.prepare(phoneCard: card)
    return phoneCardModule.controller
  }
  private func createDetailPhotoController(for url: String) -> UIViewController {
    let assembly = DetailPhotoAssembly()
    guard let delegate = coordinator as? DetailPhotoPresenterDelegateProtocol else { return UIViewController() }
    guard let detailPhotoModule = assembly.build(delegate: delegate) else { return UIViewController() }
    detailPhotoModule.presenter.preparePhoto(withUrl: url)
    return detailPhotoModule.controller
  }
}

// MARK: - ControllerBuilderProtocol implementation

extension ControllerBuilder: ControllerBuilderProtocol {
  var cordinator: CoordinatorProtocol {
    get {
      return self.coordinator
    }
    set {
      self.coordinator = newValue
    }
  }
 
  func buildPhonebookController() -> UIViewController {
   return self.createPhonebookController()
  }
  func buildPhoneCardController(for card: PhonebookObjectProtocol) -> UIViewController {
    return self.createPhoneCardController(for: card)
  }
  func buildDetailPhotoController(for url: String) -> UIViewController {
    return self.createDetailPhotoController(for: url)
  }
}
