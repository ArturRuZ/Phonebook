//
//  PhonebookViewController.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit

final class PhonebookViewController: UIViewController {
 
  // MARK: - Outlets
  
  @IBOutlet weak var phonebookTableView: UITableView!
  @IBOutlet weak var phonebookSearchBar: UISearchBar!
  
  // MARK: - Properties
  
  private var viewOutput: PhonebookViewOutputProtocol!
  private let kPhonebookCellNib = UINib(nibName: "PhonebookCell", bundle: nil)
  private let kPhonebookCellIdentifier = "kPhonebookCellReuseIdentifier"
  private var phonebookRecords = [PhonebookObjectProtocol]()


// MARK: - BuildIn methods

override func viewDidLoad() {
  super.viewDidLoad()
  setUpUI()
  setupSearchBar()
  output.viewDidLoad()
}

  // MARK: - Private methods
  
  private func setUpUI() {
    phonebookTableView.register(kPhonebookCellNib, forCellReuseIdentifier: kPhonebookCellIdentifier)
    phonebookTableView.rowHeight = UITableView.automaticDimension
    phonebookTableView.estimatedRowHeight = 80
    phonebookTableView.dataSource = self
    phonebookTableView.delegate = self
    phonebookTableView.tableFooterView = UIView(frame: CGRect.zero)
  }
}

// MARK: - Implementatin PhonebookViewInputProtocol

extension PhonebookViewController: PhonebookViewInputProtocol {
  var output: PhonebookViewOutputProtocol {
    get {
      return self.viewOutput
    }
    set {
      self.viewOutput = newValue
    }
  }
  func show(phonebook: [PhonebookObjectProtocol]) {
    self.phonebookRecords = phonebook
    phonebookTableView.reloadData()
  }
}

// MARK: - Implementatin UITableViewDataSource

extension PhonebookViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return phonebookRecords.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: kPhonebookCellIdentifier,
                                                   for: indexPath) as? PhonebookCellView else {
                                                    return UITableViewCell()
    }
    guard let phonebookRecord = phonebookRecords[indexPath.row] as? PhonebookCellProtocol else { return UITableViewCell() }
    cell.phonebookCellModel = phonebookRecord
    return cell
  }
}

// MARK: - Implementation UITableViewDelegate

extension PhonebookViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    //viewOutput.rowSelected(with: phonebookRecords[indexPath.row])
  }
}

// MARK: - Implementation Search

extension PhonebookViewController: UISearchBarDelegate {
  private func setupSearchBar() {
    phonebookSearchBar.delegate = self
  }
  func searchBarTextDidBeginEditing(_ phonebookSearchBar: UISearchBar) {
    phonebookSearchBar.showsCancelButton = true
  }
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    phonebookSearchBar.showsCancelButton = false
    phonebookTableView.reloadData()
    phonebookSearchBar.text = ""
    viewOutput.searchingEnding()
    searchBar.endEditing(true)
  }
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    viewOutput.textInputInSearchBar(textForSearch: searchText)
  }
}
