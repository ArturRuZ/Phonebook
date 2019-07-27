//
//  DetailPhotoInteractor.swift
//  DetailPhoto
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

final class DetailPhotoInteractor {
  
  // MARK: - Properties
  
  weak var interactorOutput: DetailPhotoInteractorOutputProtocol!

  // MARK: - Private methods
}

// MARK: - DetailPhotoInteractorInputProtocol implementation

extension DetailPhotoInteractor: DetailPhotoInteractorInputProtocol {
  var output: DetailPhotoInteractorOutputProtocol {
    get {
      return interactorOutput
    }
    set {
      interactorOutput = newValue
    }
  }
}
