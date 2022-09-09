//
//  StorageViewModel.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/13.
//

import Foundation
import Combine

class StorageViewModel: ObservableObject {
  private let service: JuiceServiceable
  @Published var stock: [Fruit: Int]
  var childrenViewModel: [Fruit: StorageCellViewModel]
  var cancelable = Set<AnyCancellable>()
  
  init(service: JuiceServiceable) {
    self.service = service
    self.stock = service.stock
    self.childrenViewModel = [:]
    
    for fruit in stock {
      let childrenVM = StorageCellViewModel(fruit: fruit.key, count: fruit.value)
      childrenViewModel[fruit.key] = childrenVM
    }
    
    subscriberCellCount()
  }
  
  func subscriberCellCount() {
    for vm in childrenViewModel {
      childrenViewModel[vm.key]?.$count
        .sink(receiveValue: { [weak self] amount in
          self?.stock[vm.key] = amount
        })
        .store(in: &cancelable)
    }
  }
  
  func saveStock() {
    $stock.sink { [weak self] changedStock in
      self?.service.change(stock: changedStock)
    }
    .store(in: &cancelable)
  }
}
