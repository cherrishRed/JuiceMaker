//
//  JuiceMenuViewModel.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/26.
//

import SwiftUI

class JuiceMenuViewModel: ObservableObject {
  private let service: JuiceServiceable
  var viewRouter: ViewRouter
  @Published var juices: [Juice]
  @Published var isDisable: Bool
  
  init(service: JuiceServiceable, viewRouter: ViewRouter) {
    self.service = service
    self.juices = service.juices
    self.viewRouter = viewRouter
    self.isDisable = false
  }
  
  private func makeJuice(_ index: Int) -> Result<Juice, MakeJuiceError> {
    return service.makeJuice(juices[index])
  }
  
  func pushUpMakeButton(index: Int) {
    print(index)
    switch makeJuice(index) {
    case .success(let juice):
      self.viewRouter.juice = juice
      viewRouter.isShowSuccessAlert = true
      print("\(juice.name)나왔습니다.")
    case.failure(let error):
      print("\(error)")
    }
  }
  
  func activateMakeButton(index: Int) -> Bool {
    if juices.count <= index {
      return true
    } else {
      var isEnoughStock = service.isEnoughStock(juice: juices[index])
      isEnoughStock.toggle()
      return isEnoughStock
    }
  }
  
  func controlMakeButtonOpacity(index: Int) -> Double {
    if juices.count <= index {
      return 0.0
    } else {
      return 1.0
    }
  }
  
  private func makeCellButton() -> AnyView {
    // 여기 뭔가 로직이 이상함 뷰모델이 뷰를 너무 잘아는데?
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
