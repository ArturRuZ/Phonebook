//
//  DetailPhotoViewProtocol.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol DetailPhotoViewOutputProtocol: class {
  func viewDidLoad()
}

protocol DetailPhotoViewInputProtocol: class {
  var output: DetailPhotoViewOutputProtocol {get set}
  func showPhotoWith(url: String)
}
