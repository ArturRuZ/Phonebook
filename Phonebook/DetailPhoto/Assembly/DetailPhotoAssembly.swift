//
//  DetailPhotoAssembly.swift
//  DetailPhoto
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class DetailPhotoAssembly {
  func build(delegate: DetailPhotoPresenterDelegateProtocol) -> (controller: UIViewController, presenter: DetailPhotoPresenterInputProtocol)? {
    guard let viewController = DetailPhotoViewController.instantiateFromStoryboard(with: .detailPhoto) else { return nil }
    let presenter = DetailPhotoPresenter()
    let interactor = DetailPhotoInteractor()
    viewController.output = presenter
    presenter.input = interactor
    presenter.output = viewController
    presenter.delegate = delegate
    interactor.output = presenter
    return (controller: viewController, presenter: presenter)
  }
}
