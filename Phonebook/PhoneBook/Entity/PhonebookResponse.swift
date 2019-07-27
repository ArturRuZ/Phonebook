//
//  PhonebookResponse.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

struct PhonebookResponse: Codable {
  var results: [Results]
}
struct Results: Codable {
  var name: Name
  var email: String
  var phone: String
  var picture: PhotoUrls
}
struct Name: Codable {
  var first: String
  var last: String
}
struct PhotoUrls: Codable {
  var large: String
  var medium: String
}
