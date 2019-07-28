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

// MARK: - DetailPhotoPresenterInputProtocol implementation

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
  
  func viewDidLoad() {
    self.interactor.downloadUrl()
  }
  func preparePhoto(withUrl: String) {
    self.interactor.save(url: withUrl)
  }
}

// MARK: - DetailPhotoViewOutputProtocol implementation

extension DetailPhotoPresenter: DetailPhotoViewOutputProtocol {
}

// MARK: - DetailPhotoInteractorOutputProtocol implementation

extension DetailPhotoPresenter: DetailPhotoInteractorOutputProtocol {
  func prepareForShow(url: String) {
    view.showPhotoWith(url: url)
  }
}
