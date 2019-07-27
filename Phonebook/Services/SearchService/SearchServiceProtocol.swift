//
//  SearchServiceProtocol.swift
//  Phonebook
//
//  Created by Артур on 27/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol SearchServiceProtocol: class {
  func findRecordsInPhonebook(searchText: String, phonebook: [PhonebookObjectProtocol],completion: @escaping (Result<[PhonebookObjectProtocol]>) -> Void)
}
