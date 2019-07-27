//
//  PhonecardAssembly.swift
//  Phonecard
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class PhonecardAssembly {
  func build() -> (controller: UIViewController, presenter: PhonecardPresenterInputProtocol)? {
    guard let viewController = PhonecardViewController.instantiateFromStoryboard(with: .phonecard) else {return nil}
    let presenter = PhonecardPresenter()
    let interactor = PhonecardInteractor()
    viewController.output = presenter
    presenter.input = interactor
    presenter.output = viewController
    interactor.output = presenter
    return (controller: viewController, presenter: presenter)
  }
}
