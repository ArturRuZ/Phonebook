//
//  PhonebookAssembly.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class PhonebookAssembly {
  func build(internetService: InternetServiceProtocol, searchService: SearchServiceProtocol, delegate: PhonebookPresenterDelegateProtocol) -> (controller: UIViewController, presenter: PhonebookPresenterInputProtocol)? {
    guard let viewController = PhonebookViewController.instantiateFromStoryboard(with: .phonebook) else { return nil }
    let presenter = PhonebookPresenter()
    let interactor = PhonebookInteractor(internetService: internetService, searchService: searchService)
    viewController.output = presenter
    presenter.input = interactor
    presenter.output = viewController
    presenter.delegate = delegate
    interactor.output = presenter
    return (controller: viewController, presenter: presenter)
  }
}
