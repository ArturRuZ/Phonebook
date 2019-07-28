//
//  PhoneCardViewController.swift
//  Phonebook
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import UIKit
import MessageUI

final class PhoneCardViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var phoneCardTableView: UITableView!
  
  // MARK: - Properties
  
  private var viewOutput: PhoneCardViewOutputProtocol!
  private var phonecard: PhonebookObjectProtocol!
  private let kPhoneCardNameCellNib = UINib(nibName: "PhoneCardNameCell", bundle: nil)
  private let kPhoneCardNameCellIdentifier = "PhoneCardNameCellReuseIdentifier"
  private let kPhoneCardEmailCellNib = UINib(nibName: "PhoneCardEmailCell", bundle: nil)
  private let kPhoneCardEmailCellIdentifier = "PhoneCardEmailCellReuseIdentifier"
  private let kPhoneCardMessageSendCellNib = UINib(nibName: "PhoneCardMessageSendCell", bundle: nil)
  private let kPhoneCardMessageSendCellIdentifier = "PhoneCardMessageSendCellReuseIdentifier"
  
  // MARK: - BuildIn methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpUI()
    viewOutput.viewDidLoad()
  }
  
  deinit {
    print ("PhoneCardViewController Deinited")
  }
  
  // MARK: - Private methods
  
  private func setUpUI() {
    self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem.init(
      title: "Back", style: .plain, target: nil, action: nil)
    phoneCardTableView.register(kPhoneCardNameCellNib, forCellReuseIdentifier: kPhoneCardNameCellIdentifier)
    phoneCardTableView.register(kPhoneCardEmailCellNib, forCellReuseIdentifier: kPhoneCardEmailCellIdentifier)
    phoneCardTableView.register(kPhoneCardMessageSendCellNib , forCellReuseIdentifier: kPhoneCardMessageSendCellIdentifier)
    phoneCardTableView.rowHeight = UITableView.automaticDimension
    phoneCardTableView.estimatedRowHeight = 80
    phoneCardTableView.dataSource = self
    phoneCardTableView.delegate = self
    phoneCardTableView.tableFooterView = UIView(frame: CGRect.zero)
  }
}

// MARK: - Implementation PhoneCardViewInputProtocol

extension PhoneCardViewController: PhoneCardViewInputProtocol {
  var output: PhoneCardViewOutputProtocol {
    get {
      return self.viewOutput
    }
    set {
      self.viewOutput = newValue
    }
  }
  
  func show(phoneCard: PhonebookObjectProtocol) {
    self.phonecard = phoneCard
    phoneCardTableView.reloadData()
  }
}

// MARK: - Implementation UITableViewDataSource

extension PhoneCardViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
      
      // MARK: - PhoneCardNameCell Implementation
      
    case 0:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: kPhoneCardNameCellIdentifier,
                                                     for: indexPath) as? PhoneCardNameCellView else {
                                                      return UITableViewCell()
      }
      guard let phoneCardName = self.phonecard  as? PhoneCardNameCellProtocol else { return UITableViewCell() }
      cell.delegate = self
      cell.phoneCardCellModel = phoneCardName
      cell.selectionStyle = UITableViewCell.SelectionStyle.none
      return cell
      
      // MARK: - PhoneCardEmailCell Implementation
      
    case 1:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: kPhoneCardEmailCellIdentifier,
                                                     for: indexPath) as? PhoneCardEmailCellView else {
                                                      return UITableViewCell()
      }
      guard let phoneCardEmail = self.phonecard  as? PhoneCardEmailCellProtocol else { return UITableViewCell() }
      cell.phoneCardEmailCellModel = phoneCardEmail
      return cell
      
    // MARK: - PhoneCardMessageSendCell Implementation
      
    case 2:
      return tableView.dequeueReusableCell(withIdentifier: kPhoneCardMessageSendCellIdentifier, for: indexPath)
      
      // MARK: - Other Cell Implementation
      
    default:
      return UITableViewCell()
    }
  }
}

// MARK: - Implementation UITableViewDelegate

extension PhoneCardViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    switch indexPath.row {
    case 2:
      self.sendMessage()
    default:
      return
    }
  }
}

// MARK: - Implementation PhoneCardNameCellDelegateProtocol

extension PhoneCardViewController: PhoneCardNameCellDelegateProtocol {
  func personPhotoSelected() {
    viewOutput.personPhotoSelectedWith(url: self.phonecard.largePhotoUrl)
  }
  func callButtonPressed() {
    guard let number = URL(string: "tel://" + "+7" + self.phonecard.phone) else { return }
    UIApplication.shared.open(number)
  }
}

// MARK: - SMS send Implementation with MFMessageComposeViewControllerDelegate

extension PhoneCardViewController: MFMessageComposeViewControllerDelegate {
  func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
    switch (result) {
    case .cancelled:
      print("Message was cancelled")
      dismiss(animated: true, completion: nil)
    case .failed:
      print("Message failed")
      dismiss(animated: true, completion: nil)
    case .sent:
      print("Message was sent")
      dismiss(animated: true, completion: nil)
    default:
      break
    }
  }
  private func sendMessage() {
  let messageVC = MFMessageComposeViewController()
  messageVC.recipients = ["\("+7" + self.phonecard.phone)"]
  messageVC.messageComposeDelegate = self
  self.present(messageVC, animated: true, completion: nil)
  }
}
