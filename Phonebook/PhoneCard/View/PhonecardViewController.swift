//
//  PhonecardViewController.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class PhonecardViewController: UIViewController {
  private var viewOutput: PhonecardViewOutputProtocol!
  
}

// MARK: - Implementatin UITableViewDataSource

extension PhonecardViewController: PhonecardViewInputProtocol {
  var output: PhonecardViewOutputProtocol {
    get {
      return self.viewOutput
    }
    set {
      self.viewOutput = newValue
    }
  }
}
