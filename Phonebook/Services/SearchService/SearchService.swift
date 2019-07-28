//
//  SearchService.swift
//  Phonebook
//
//  Created by Артур on 27/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

final class SearchService {
  
  // MARK: - Properties
  
  private var searchQueue = OperationQueue()
  
  // MARK: - Initialization
  
  init() {
    searchQueue.name = "Search queue"
    searchQueue.maxConcurrentOperationCount = 1
  }
}

// MARK: - SearchService protocol Implementation

extension SearchService: SearchServiceProtocol {
  func findRecordsInPhonebook(searchText: String, phonebook: [PhonebookObjectProtocol], completion: @escaping (Result<[PhonebookObjectProtocol]>) -> Void) {
    searchQueue.cancelAllOperations()
    searchQueue.addOperation (
      SearchInPhonebookOperation(searchText: searchText, phonebook: phonebook, completion: completion)
    )}
}
