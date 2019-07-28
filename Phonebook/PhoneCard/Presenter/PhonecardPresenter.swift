//
//  PhoneCardPresenter.swift
//  PhoneCard
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

final class PhoneCardPresenter {
  
  // MARK: - properties
  
  private weak var presenterDelegate: PhoneCardPresenterDelegateProtocol!
  private weak var view: PhoneCardViewInputProtocol!
  private var interactor: PhoneCardInteractorInputProtocol!
}

// MARK: - PhoneCard_PresenterInputProtocol implementation

extension PhoneCardPresenter: PhoneCardPresenterInputProtocol {
  var delegate: PhoneCardPresenterDelegateProtocol {
    get {
      return presenterDelegate
    }
    set {
      presenterDelegate = newValue
    }
  }
  var input: PhoneCardInteractorInputProtocol {
    get {
      return interactor
    }
    set {
      interactor = newValue
    }
  }
  var output: PhoneCardViewInputProtocol {
    get {
      return view
    }
    set {
      view = newValue
    }
  }
  
  func prepare(phoneCard: PhonebookObjectProtocol) {
    interactor.save(phoneCard: phoneCard)
  }
}

// MARK: - PhoneCardViewOutputProtocol implementation

extension PhoneCardPresenter: PhoneCardViewOutputProtocol {
  func viewDidLoad() {
    self.interactor.downloadPhoneCard()
  }
  func personPhotoSelectedWith(url: String) {
    self.delegate.showPhotoWith(url: url)
  }
}

// MARK: - PhoneCard_InteractorOutputProtocol implementation

extension PhoneCardPresenter: PhoneCardInteractorOutputProtocol {
  func prepareForShow(phoneCard: PhonebookObjectProtocol) {
    self.view.show(phoneCard: phoneCard)
  }
}
