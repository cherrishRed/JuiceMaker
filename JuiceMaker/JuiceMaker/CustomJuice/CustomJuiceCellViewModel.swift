//
//  CustomJuiceCellViewModel.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/27.
//

import Foundation

class CustomJuiceCellViewModel: ObservableObject {
  @Published var fruit: Fruit
  @Published var amount: Int
  
  init(fruit: Fruit, amount: Int) {
    self.fruit = fruit
    self.amount = amount
  }
}
