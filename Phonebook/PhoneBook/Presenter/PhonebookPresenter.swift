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

// MARK: - PhonebookPresenterInputProtocol implementation

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

// MARK: - PhonebookViewOutputProtocol implementation

extension PhonebookPresenter: PhonebookViewOutputProtocol {
  func viewDidLoad() {
    self.interactor.downloadPhonebook()
  }
  func textInputInSearchBar(textForSearch: String) {
    self.interactor.findBy(textForSearch)
  }
  func  searchingEnding() {
    self.interactor.endSearch()
  }
}

// MARK: - PhonebookInteractorOutputProtocol implementation

extension PhonebookPresenter: PhonebookInteractorOutputProtocol {
  func prepare(phonebook: [PhonebookObjectProtocol]) {
  self.view.show(phonebook: phonebook)
  }
}
