//
//  PhonebookPresenter.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

final class PhonebookPresenter {
  
  // MARK: - properties
  
  private weak var presenterDelegate: PhonebookPresenterDelegateProtocol!
  private weak var view: PhonebookViewInputProtocol!
  private var interactor: PhonebookInteractorInputProtocol!
}

// MARK: - Phonebook_PresenterInputProtocol implementation

extension PhonebookPresenter: PhonebookPresenterInputProtocol {
  var delegate: PhonebookPresenterDelegateProtocol {
    get {
      return presenterDelegate
    }
    set {
      presenterDelegate = newValue
    }
  }
  var input: PhonebookInteractorInputProtocol {
    get {
      return interactor
    }
    set {
      interactor = newValue
    }
  }
  var output: PhonebookViewInputProtocol {
    get {
      return view
    }
    set {
      view = newValue
    }
  }
}

// MARK: - Phonebook_ViewOutputProtocol implementation

extension PhonebookPresenter: PhonebookViewOutputProtocol {
}

// MARK: - Phonebook_InteractorOutputProtocol implementation

extension PhonebookPresenter: PhonebookInteractorOutputProtocol {
}
