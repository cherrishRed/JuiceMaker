//
//  JuiceMenuViewModel.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/26.
//

import SwiftUI

class JuiceMenuViewModel: ObservableObject {
  private let service: JuiceService
  var viewRouter: ViewRouter
  @Published var juices: [Juice]
  @Published var isShowErrorAlert = false
  @Published var error: MakeJuiceError = .NoneKeyError
  
  init(service: JuiceService, viewRouter: ViewRouter) {
    self.service = service
    self.juices = service.juices
    self.viewRouter = viewRouter
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
  
  private func makeCellButton() -> AnyView {
    return AnyView(NewRecipeButtonView(viewRouter: viewRouter))
  }
  
  func makeCellViews(menu: [Juice]) -> [AnyView] {
    var views: [AnyView] = []
    for juice in menu {
      views.append(AnyView(JuiceCellView(juice: juice)))
    }
    views.append(makeCellButton())
    return views
  }
}
