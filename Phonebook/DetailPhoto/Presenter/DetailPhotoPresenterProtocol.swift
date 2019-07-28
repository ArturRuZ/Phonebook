//
//  DetailPhotoPresenterProtocol.swift
//  DetailPhoto
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol DetailPhotoPresenterInputProtocol: class {
  var delegate: DetailPhotoPresenterDelegateProtocol {get set}
  var input: DetailPhotoInteractorInputProtocol {get set}
  var output: DetailPhotoViewInputProtocol {get set}
  func preparePhoto(withUrl: String)
}
protocol DetailPhotoPresenterDelegateProtocol: class {}
