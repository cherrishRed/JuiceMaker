//
//  Recipe.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/13.
//

import Foundation

class Recipe {
  init(ingredient: [Fruit : Int]) {
    self.ingredient = ingredient
  }
  
  var ingredient: [Fruit: Int]
}
