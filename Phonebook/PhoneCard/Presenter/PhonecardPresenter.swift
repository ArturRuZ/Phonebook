//
//  PhonecardPresenter.swift
//  Phonecard
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

final class PhonecardPresenter {
  
  // MARK: - properties
  
  private weak var presenterDelegate: PhonecardPresenterDelegateProtocol!
  private weak var view: PhonecardViewInputProtocol!
  private var interactor: PhonecardInteractorInputProtocol!
}

// MARK: - Phonecard_PresenterInputProtocol implementation

extension PhonecardPresenter: PhonecardPresenterInputProtocol {
  var delegate: PhonecardPresenterDelegateProtocol {
    get {
      return presenterDelegate
    }
    set {
      presenterDelegate = newValue
    }
  }
  var input: PhonecardInteractorInputProtocol {
    get {
      return interactor
    }
    set {
      interactor = newValue
    }
  }
  var output: PhonecardViewInputProtocol {
    get {
      return view
    }
    set {
      view = newValue
    }
  }
}

// MARK: - Phonecard_ViewOutputProtocol implementation

extension PhonecardPresenter: PhonecardViewOutputProtocol {
}

// MARK: - Phonecard_InteractorOutputProtocol implementation

extension PhonecardPresenter: PhonecardInteractorOutputProtocol {
}
