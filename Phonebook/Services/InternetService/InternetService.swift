//
//  InternetService.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

final class InternetService {
  
  // MARK: - Properties
  
  private var operationQueue = OperationQueue()
  
  // MARK: - Initialization
  
  init() {
    operationQueue.name = "Download queue"
    operationQueue.maxConcurrentOperationCount = 1
  }
  
  // MARK: - Private methods
  
  private func parse<T>(data: Data, container: T.Type, completion: @escaping (Result<T>) -> Void) where T: Codable {
    do {
      let response = try JSONDecoder().decode(container, from: data)
      DispatchQueue.main.async {
        completion(Result(value: response))
      }
    } catch {
      completion (Result(error: error))
    }
  }
}

// MARK: - InternetServiceProtocol implementation

extension InternetService: InternetServiceProtocol {
  func translateData<T>(fromURL: URL?, parseInto container: T.Type, completion: @escaping (Result<T>) -> Void) where T: Codable {
    guard let url = fromURL else {
      completion(Result(error: ErrorsList.urlIsIncorrect))
      return
    }
    operationQueue.cancelAllOperations()
    operationQueue.addOperation (
      DownloadOperation(url: url, completion: { [weak self] result in
        guard let self = self else {return}
        if let error = result.error {
          completion(Result(error: error))
        } else {
          guard let data = result.success else {return}
          self.parse(data: data, container: container, completion: completion)
        }
      })
    )
  }
}
