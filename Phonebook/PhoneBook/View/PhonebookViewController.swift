//
//  PhonebookViewController.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class PhonebookViewController: UIViewController {
  private var viewOutput: PhonebookViewOutputProtocol!

}

// MARK: - Implementatin UITableViewDataSource

extension PhonebookViewController: PhonebookViewInputProtocol {
  var output: PhonebookViewOutputProtocol {
    get {
      return self.viewOutput
    }
    set {
      self.viewOutput = newValue
    }
  }
}
