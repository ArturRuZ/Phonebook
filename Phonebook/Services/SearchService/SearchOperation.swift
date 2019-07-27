//
//  SearchOperation.swift
//  Phonebook
//
//  Created by Артур on 27/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

final class  SearchInPhonebookOperation: Operation {
  
  // MARK: - Properties
  
  let searchText: String
  let phonebook: [PhonebookObjectProtocol]
  let completion: (Result<[PhonebookObjectProtocol]>) -> Void
  
  // MARK: - Initialization
  
  init(searchText: String, phonebook: [PhonebookObjectProtocol], completion: @escaping (Result<[PhonebookObjectProtocol]>) -> Void) {
    self.searchText = searchText
    self.phonebook = phonebook
    self.completion = completion
    super.init()
  }
  
  // MARK: - BuildIn Methods
  
  override func main() {
    if self.isCancelled {
      self.completion(Result(error: ErrorsList.searchIsCanceled))
    }
    var foundObjects = [PhonebookObjectProtocol]()
    _ = self.phonebook.compactMap({
      if $0.getFullName().localizedCaseInsensitiveContains(searchText) {
        foundObjects.append($0)
      }
    })
    if foundObjects.count == 0 {
    completion(Result(error: ErrorsList.recordsInPhonebookNotFound))
    } else {
    self.completion(Result(value: foundObjects))
    }
  }
}

