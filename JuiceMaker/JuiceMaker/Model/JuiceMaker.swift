//
//  JuiceMaker.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/13.
//

import Foundation

struct JuiceMaker {
  var menu: [Juice] = [Juice(name: "딸기 주스",recipe: Recipe(ingredient: [Fruit(name: "딸기", icon: "🍓"): 10])),
                       Juice(name: "사과 주스",recipe: Recipe(ingredient: [Fruit(name: "딸기", icon: "🍎"): 10])),
                       Juice(name: "수박 주스",recipe: Recipe(ingredient: [Fruit(name: "딸기", icon: "🍉"): 10])),
                       Juice(name: "바나나 주스",recipe: Recipe(ingredient: [Fruit(name: "딸기", icon: "🍌"): 10])),
                       Juice(name: "망고 주스",recipe: Recipe(ingredient: [Fruit(name: "딸기", icon: "🥭"): 10])),]
}
