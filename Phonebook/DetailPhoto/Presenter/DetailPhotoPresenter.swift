//
//  DetailPhotoPresenter.swift
//  DetailPhoto
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

final class DetailPhotoPresenter {
  
  // MARK: - properties
  
  private weak var presenterDelegate: DetailPhotoPresenterDelegateProtocol!
  private weak var view: DetailPhotoViewInputProtocol!
  private var interactor: DetailPhotoInteractorInputProtocol!
}

// MARK: - DetailPhoto_PresenterInputProtocol implementation

extension DetailPhotoPresenter: DetailPhotoPresenterInputProtocol {
  var delegate: DetailPhotoPresenterDelegateProtocol {
    get {
      return presenterDelegate
    }
    set {
      presenterDelegate = newValue
    }
  }
  var input: DetailPhotoInteractorInputProtocol {
    get {
      return interactor
    }
    set {
      interactor = newValue
    }
  }
  var output: DetailPhotoViewInputProtocol {
    get {
      return view
    }
    set {
      view = newValue
    }
  }
}

// MARK: - DetailPhoto_ViewOutputProtocol implementation

extension DetailPhotoPresenter: DetailPhotoViewOutputProtocol {
}

// MARK: - DetailPhoto_InteractorOutputProtocol implementation

extension DetailPhotoPresenter: DetailPhotoInteractorOutputProtocol {
}
