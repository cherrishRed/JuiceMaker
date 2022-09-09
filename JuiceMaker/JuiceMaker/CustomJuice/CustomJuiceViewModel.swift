//
//  CustomJuiceViewModel.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/27.
//

import SwiftUI
import Combine

class CustomJuiceViewModel: ObservableObject {
  @Published var juiceName: String = ""
  @Published var recipe: [(Fruit, Int)] = [(.strawberry, 1)]
  @Published var selectedColor: Color = .white
  private let service: JuiceServiceable
  var childrenViewModel: [IngredientViewModel] = [IngredientViewModel(fruit: .strawberry, amount: 1)]
  var cancelable = Set<AnyCancellable>()

  init(service: JuiceServiceable) {
    self.service = service
    subscriberCellFruit()
    subscriberCellAmount()
  }
  
  func addNewIngredient() {
    recipe.append((.strawberry, 1))
    childrenViewModel.append(IngredientViewModel(fruit: .strawberry, amount: 1))
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
  
  func saveNewJuiceRecipe() {
    let newRecipe: Recipe = Recipe(ingredient: [:])
    recipe.forEach { (fruit, amount) in
      newRecipe.ingredient[fruit] = amount
    }
    
    service.addNewJuice(Juice(name: juiceName, recipe: newRecipe, color: selectedColor))
    // 조건 이름에 주스가 있어야 한다.
    // 같은 과일을 두개 넣는 것은 안된다.
  }
}
