//
//  JuiceService.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/26.
//

import SwiftUI

protocol JuiceServiceable {
  var stock: [Fruit: Int] { get }
  var juices: [Juice] { get }
  
  func plusStock(fruit: Fruit)
  func minusStock(fruit: Fruit)
  func addNewJuice(_ juice: Juice)
  func makeJuice(_ juice: Juice) -> Result<Juice, MakeJuiceError>
  func change(stock: [Fruit: Int])
}



class JuiceService: ObservableObject, JuiceServiceable {
  @Published var stock: [Fruit: Int]
  @Published var juices: [Juice]
  
  init(stock: [Fruit: Int] = [.strawberry: 12,
                            .apple: 3,
                            .peach: 4,
                            .watermelcon: 5,
                            .banana: 6,
                            .mango: 7,
                            .kiwi: 8],
       juices: [Juice] = [Juice(name: "딸기 주스", recipe: Recipe(ingredient: [.strawberry: 10]), color: Color("strawberryPink")),
                          Juice(name: "사과 주스",recipe: Recipe(ingredient: [.apple: 3]), color: Color("appleGreen")),
                          Juice(name: "수박 주스",recipe: Recipe(ingredient: [.watermelcon: 1]), color: Color("watermelonRed")),
                          Juice(name: "바나나 주스",recipe: Recipe(ingredient: [.banana: 5]), color: Color("bananaYellow")),
                          Juice(name: "망고 주스",recipe: Recipe(ingredient: [.mango: 4]), color: Color("mangoYellow"))]) {
    self.stock = stock
    self.juices = juices
  }
  
  func plusStock(fruit: Fruit) {
    guard let count = stock[fruit] else { return }
    stock[fruit] = count + 1
  }
  
  func minusStock(fruit: Fruit) {
    guard let count = stock[fruit] else { return }
    if count > 0 {
      stock[fruit] = count - 1
    }
  }
  
  func addNewJuice(_ juice: Juice) {
    juices.append(juice)
  }
  
  func makeJuice(_ juice: Juice) -> Result<Juice, MakeJuiceError> {
    for ingredient in juice.recipe.ingredient {
      guard let count = stock[ingredient.key] else {
        return .failure(.NoneKeyError)
      }
      
      if count < ingredient.value {
        return .failure(.OutOfStockError)
      }
      
      let remainAmount = count - ingredient.value
      stock[ingredient.key] = remainAmount
    }
      return .success(juice)
  }
  
  func change(stock: [Fruit : Int]) {
    self.stock = stock
  }
}
