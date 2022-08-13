//
//  Fruit.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/13.
//

import Foundation

struct Fruit: Hashable, Comparable {
  var name: String
  var icon: String
  
  static func < (lhs: Fruit, rhs: Fruit) -> Bool {
    lhs.name < rhs.name
  }
}
