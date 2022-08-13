//
//  StorageCellViewModel.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/14.
//

import Foundation
import Combine

class StorageCellViewModel: ObservableObject {
  var fruit: Fruit
  @Published var count: Int
  
  init(fruit: Fruit, count: Int) {
    self.fruit = fruit
    self.count = count
  }
  
  func plusFruit() {
    count += 1
  }
  
  func minusFruit() {
    if count > 0 {
      count -= 1
    }
    
  }
}
