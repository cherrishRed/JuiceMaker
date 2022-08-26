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
  @Published var isShowErrorAlert = false
  @Published var error: MakeJuiceError = .NoneKeyError
  
  init(service: JuiceService) {
    self.service = service
    self.juices = service.juices
  }
  
  private func makeJuice(_ index: Int) -> Result<Juice, MakeJuiceError> {
    return service.makeJuice(juices[index])
  }
  
  func pushUpMakeButton(index: Int) {
    print(index)
    switch makeJuice(index) {
    case .success(let juice):
      print("\(juice.name)나왔습니다.")
    case.failure(let error):
      self.error = error
      self.isShowErrorAlert = true
      print("\(error)")
    }
  }
}
