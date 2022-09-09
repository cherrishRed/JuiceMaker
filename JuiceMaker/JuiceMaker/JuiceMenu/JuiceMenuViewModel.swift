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
  @Published var isShowErrorAlert: Bool
  @Published var isShowSuccessAlert: Bool
  @Published var error: MakeJuiceError
  @Published var juice: Juice
  
  init(service: JuiceServiceable, viewRouter: ViewRouter) {
    self.service = service
    self.juices = service.juices
    self.viewRouter = viewRouter
    self.isShowErrorAlert = false
    self.isShowSuccessAlert = false
    self.error = .NoneKeyError
    self.juice = Juice(name: "잘못된 주스", recipe: Recipe(ingredient: [.strawberry: 10]), color: Color("strawberryPink"))
  }
  
  private func makeJuice(_ index: Int) -> Result<Juice, MakeJuiceError> {
    return service.makeJuice(juices[index])
  }
  
  func pushUpMakeButton(index: Int) {
    print(index)
    switch makeJuice(index) {
    case .success(let juice):
      self.juice = juice
      print("\(juice.name)나왔습니다.")
      isShowSuccessAlert = true
    case.failure(let error):
      self.error = error
      self.isShowErrorAlert = true
      print("\(error)")
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
