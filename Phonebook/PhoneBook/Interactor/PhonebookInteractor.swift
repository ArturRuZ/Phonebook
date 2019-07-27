//
//  PhonebookInteractor.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

final class PhonebookInteractor {
  
  // MARK: - Properties
  
  weak var interactorOutput: PhonebookInteractorOutputProtocol!
  private let internetService: InternetServiceProtocol
  private let searchService: SearchServiceProtocol
  private var currentPhonebook = [PhonebookObjectProtocol]()
  
  
  // MARK: - Initialization
  
  init(internetService: InternetServiceProtocol, searchService: SearchServiceProtocol) {
    self.internetService = internetService
    self.searchService = searchService
  }
  
  // MARK: - Private methods
  private func mergeSort(_ array: [PhonebookObjectProtocol]) -> [PhonebookObjectProtocol] {
    guard array.count > 1 else { return array }
    let middleIndex = array.count / 2
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    return merge(leftPart: leftArray, rightPart: rightArray)
  }
  private func merge(leftPart: [PhonebookObjectProtocol], rightPart: [PhonebookObjectProtocol]) -> [PhonebookObjectProtocol] {
    var leftIndex = 0
    var rightIndex = 0
    var orderedPile = [PhonebookObjectProtocol]()
    orderedPile.reserveCapacity(leftPart.count + rightPart.count)
    while leftIndex < leftPart.count && rightIndex < rightPart.count {
      if leftPart[leftIndex].firstName < rightPart[rightIndex].firstName {
        orderedPile.append(leftPart[leftIndex])
        leftIndex += 1
      } else if leftPart[leftIndex].firstName > rightPart[rightIndex].firstName {
        orderedPile.append(rightPart[rightIndex])
        rightIndex += 1
      } else {
        orderedPile.append(leftPart[leftIndex])
        leftIndex += 1
        orderedPile.append(rightPart[rightIndex])
        rightIndex += 1
      }
    }
    while leftIndex < leftPart.count {
      orderedPile.append(leftPart[leftIndex])
      leftIndex += 1
    }
    while rightIndex < rightPart.count {
      orderedPile.append(rightPart[rightIndex])
      rightIndex += 1
    }
    return orderedPile
  }
}

// MARK: - PhonebookInteractorInputProtocol implementation

extension PhonebookInteractor: PhonebookInteractorInputProtocol {
  var output: PhonebookInteractorOutputProtocol {
    get {
      return interactorOutput
    }
    set {
      interactorOutput = newValue
    }
  }
  
  func downloadPhonebook() {
    let url = "https://randomuser.me/api/?inc=name,email,phone,picture&results=1000&nat=us"
    self.internetService.downloadData(fromURL: URL(string: url), parseInto: PhonebookResponse.self) { [weak self] result in
      guard let self = self else { return }
      if let error = result.error {
        print (error)
        return
      }
      guard let succsses = result.success else { return }
      if succsses.results.count == 0 { return }
      self.currentPhonebook = succsses.results.compactMap({PhonebookObject(firstName: $0.name.first,
                                                                           lastName: $0.name.last,
                                                                           email: $0.email,
                                                                           phone: $0.phone,
                                                                           smallPhotoUrl: $0.picture.medium,
                                                                           largePhotoUrl: $0.picture.large)
      })
      self.currentPhonebook = self.mergeSort(self.currentPhonebook)
      DispatchQueue.main.async {
        self.output.prepare(phonebook: self.currentPhonebook)
      }
    }
  }
  func findBy(_ fio: String) {
    if fio == "" {
      self.endSearch()
      return
    }
    self.searchService.findRecordsInPhonebook(searchText: fio, phonebook: self.currentPhonebook) { result in
      if let error = result.error {
        print (error)
        DispatchQueue.main.async {
          self.output.prepare(phonebook: [PhonebookObjectProtocol]())
        }
      }
      guard let succsses = result.success else {return}
      DispatchQueue.main.async {
        self.output.prepare(phonebook: succsses)
      }
    }
  }
  func endSearch() {
    self.output.prepare(phonebook: currentPhonebook)
  }
}
