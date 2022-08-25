//
//  Fruit.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/13.
//

import Foundation

enum Fruit: String, Comparable {
  static func < (lhs: Fruit, rhs: Fruit) -> Bool {
    lhs.rawValue < rhs.rawValue
  }
  
  case strawberry
  case apple
  case watermelcon
  case banana
  case mango
  case peach
  case kiwi
  
  var icon: String {
    switch self {
    case .strawberry:
      return "🍓"
    case .apple:
      return "🍏"
    case .watermelcon:
      return "🍉"
    case .banana:
      return "🍌"
    case .mango:
      return "🥭"
    case .peach:
      return "🍑"
    case .kiwi:
      return "🥝"
    }
  }
}
