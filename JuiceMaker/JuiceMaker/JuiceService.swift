//
//  JuiceService.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/26.
//

import Foundation

class JuiceService: ObservableObject {
  @Published var stock: [Fruit: Int]
  @Published var juices: [Juice]
  
  init(stock: [Fruit: Int] = [.strawberry: 12,
                            .apple: 3,
                            .peach: 4,
                            .watermelcon: 5,
                            .banana: 6,
                            .mango: 7,
                            .kiwi: 8],
       juices: [Juice] = [Juice(name: "딸기 주스", recipe: Recipe(ingredient: [.strawberry: 10]), color: "strawberryPink"),
                          Juice(name: "사과 주스",recipe: Recipe(ingredient: [.apple: 3]), color: "appleGreen"),
                          Juice(name: "수박 주스",recipe: Recipe(ingredient: [.watermelcon: 1]), color: "watermelonRed"),
                          Juice(name: "바나나 주스",recipe: Recipe(ingredient: [.banana: 5]), color: "bananaYellow"),
                          Juice(name: "망고 주스",recipe: Recipe(ingredient: [.mango: 4]), color: "mangoYellow")]) {
    self.stock = stock
    self.juices = juices
  }
  
  func plusStock(fruit: Fruit) {
    guard let count = stock[fruit] else { return }
    stock[fruit] = count + 1
  }
  
  func minusStock(fruit: Fruit, count: Int) {
    guard let count = stock[fruit] else { return }
    if count > 0 {
      stock[fruit] = count - 1
    }
  }
  
  func addNewJuice(_ juice: Juice) {
    juices.append(juice)
  }
  
  
}
