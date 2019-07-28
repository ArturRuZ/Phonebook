//
//  ControllerBuilderProtocol.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

protocol ControllerBuilderProtocol: class {
  var cordinator: CoordinatorProtocol {get set}
  func buildPhonebookController() -> UIViewController
  func buildPhoneCardController(for card: PhonebookObjectProtocol) -> UIViewController
  func buildDetailPhotoController(for url: String) -> UIViewController
}
