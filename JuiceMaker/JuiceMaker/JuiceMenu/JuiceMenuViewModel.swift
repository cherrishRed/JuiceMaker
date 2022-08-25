//
//  JuiceMenuViewModel.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/26.
//

import Foundation

class JuiceMenuViewModel: ObservableObject {
  private let service: JuiceService
  @Published var juices: [Juice]
  
  init(service: JuiceService) {
    self.service = service
    self.juices = service.juices
  }
  
  func makeJuice(_ index: Int) {
    service.makeJuice(juices[index])
  }
}
