//
//  PhoneCardAssembly.swift
//  PhoneCard
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class PhoneCardAssembly {
  func build(delegate: PhoneCardPresenterDelegateProtocol) -> (controller: UIViewController, presenter: PhoneCardPresenterInputProtocol)? {
    guard let viewController = PhoneCardViewController.instantiateFromStoryboard(with: .phoneCard) else { return nil }
    let presenter = PhoneCardPresenter()
    let interactor = PhoneCardInteractor()
    viewController.output = presenter
    presenter.input = interactor
    presenter.output = viewController
    presenter.delegate = delegate
    interactor.output = presenter
    return (controller: viewController, presenter: presenter)
  }
}
