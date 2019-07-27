//
//  PhonecardPresenterProtocol.swift
//  Phonecard
//
//  Created by Артур on 26/07/2019.
//  Copyright © 2019 Артур. All rights reserved.
//

import Foundation

protocol PhonecardPresenterInputProtocol: class {
  var delegate: PhonecardPresenterDelegateProtocol {get set}
  var input: PhonecardInteractorInputProtocol {get set}
  var output: PhonecardViewInputProtocol {get set}
}
protocol PhonecardPresenterDelegateProtocol: class {}
