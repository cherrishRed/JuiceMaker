//
//  StorageViewModel.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/13.
//

import Foundation

class StorageViewModel {
  var fruits: [Fruit: Int] = [Fruit.init(name: "딸기", icon: "🍓"): 12,
                              Fruit.init(name: "사과", icon: "🍎"): 3,
                              Fruit.init(name: "복숭아", icon: "🍑"): 4,
                              Fruit.init(name: "수박", icon: "🍉"): 5,
                              Fruit.init(name: "바나나", icon: "🍌"): 6,
                              Fruit.init(name: "망고", icon: "🥭"): 7,
                              Fruit.init(name: "키위", icon: "🥝"): 8]
}
