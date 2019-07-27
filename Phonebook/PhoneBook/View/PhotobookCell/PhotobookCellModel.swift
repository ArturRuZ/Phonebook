//
//  PhotobookCellModel.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

protocol PhotobookCellModel {
  var firstName: String {get}
  var patronymic: String {get}
  var lastName: String {get}
  var photo: UIImage {get set}
}
