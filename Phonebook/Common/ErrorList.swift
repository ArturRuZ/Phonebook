//
//  ErrorList.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

enum ErrorsList: Error {
  case urlIsIncorrect
  case downloadIsCanceled
  case searchIsCanceled
  case recordsInPhonebookNotFound
}
