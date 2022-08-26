//
//  CustomJuiceViewModel.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/27.
//

import Foundation
import Combine

class CustomJuiceViewModel: ObservableObject {
  @Published var juiceName: String = ""
  @Published var recipe: [(Fruit, Int)] = [(.strawberry, 1)]
  var childrenViewModel: [CustomJuiceCellViewModel] = [CustomJuiceCellViewModel(fruit: .strawberry, amount: 1)]
  var cancelable = Set<AnyCancellable>()

  init() {
    subscriberCellFruit()
    subscriberCellAmount()
  }
  
  func addNewIngredient() {
    recipe.append((.strawberry, 1))
    childrenViewModel.append(CustomJuiceCellViewModel(fruit: .strawberry, amount: 1))
    subscriberCellFruit()
    subscriberCellAmount()
  }
  
  private func changeFruit(index: Int, fruit: Fruit) {
    let ( _, count) = recipe[index]
   recipe[index] = (fruit, count)
  }
  
  private func changeAmount(index: Int, amount: Int) {
    let ( fruit, _) = recipe[index]
   recipe[index] = (fruit, amount)
  }
  
  private func subscriberCellFruit() {
    for (index, vm) in childrenViewModel.enumerated() {
      vm.$fruit
        .sink(receiveValue: { [weak self] fruit in
          self?.changeFruit(index: index, fruit: fruit)
          print("\(self?.recipe)")
        })
      .store(in: &cancelable)
    }

  }
  
  private func subscriberCellAmount() {
    for (index, vm) in childrenViewModel.enumerated() {
      vm.$amount
        .sink(receiveValue: { [weak self] amount in
          self?.changeAmount(index: index, amount: amount)
          print("\(self?.recipe)")
        })
      .store(in: &cancelable)
    }

  }
}
