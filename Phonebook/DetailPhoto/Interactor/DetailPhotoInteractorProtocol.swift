//
//  DetailPhoto.swift
//  DetailPhoto
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol  DetailPhotoInteractorInputProtocol: class {
  var output: DetailPhotoInteractorOutputProtocol {get set}
  func save(url: String)
  func downloadUrl()
}

protocol  DetailPhotoInteractorOutputProtocol: class {
  func prepareForShow(url: String)
}
