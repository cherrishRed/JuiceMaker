//
//  StorageViewModel.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/13.
//

import Foundation

class StorageViewModel {
  private let service: JuiceService
  var fruits: [Fruit: Int]
  
  init(service: JuiceService) {
    self.service = service
    self.fruits = service.stock
  }
  
  
  
}
