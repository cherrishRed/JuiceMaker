//
//  JuiceMenuView.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/24.
//

import SwiftUI

struct JuiceMenuView: View {
  @State var tag:Int? = nil
  @ObservedObject var viewRouter: ViewRouter
  @ObservedObject var viewModel: JuiceMenuViewModel
  @State var currentIndex: Int = 0
  
  var body: some View {
    ZStack {
      Rectangle()
        .fill(.yellow)
        .ignoresSafeArea()
      VStack(spacing: 50) {
        Text("JuiceMaker")
          .font(Font.custom("BMJUAOTF", size: 36))
          .padding(.top)
        CarouselView(views: makeCellViews(menu: viewModel.juices), currentIndex: $currentIndex)
        
        VStack(spacing: 20) {
          Button {
            print(currentIndex)
            switch viewModel.makeJuice(currentIndex) {
            case .success(let juice):
              print("\(juice.name)나왔습니다.")
            case.failure(let error):
              print("\(error)")
            }
          } label: {
            Text("만들기")
              .font(Font.custom("BMJUAOTF", size: 24))
          }
          .buttonStyle(MyButtonStyle(backgroundColor: .white, shadowColor: .red))
          
          Button {
            viewRouter.currentPage = "StorageView"
          } label: {
            Text("📦")
          }
          .buttonStyle(NavButtonStyle(backgroundColor: .white, shadowColor: Color("storageBrown")))
        }
      }
    }
  }

  
  func makeCellViews(menu: [Juice]) -> [AnyView] {
    var views: [AnyView] = []
    for juice in menu {
      views.append(AnyView(JuiceCellView(juice: juice)))
    }
    return views
  }
}

struct JuiceMenuView_Previews: PreviewProvider {
    static var previews: some View {
      JuiceMenuView(viewRouter: ViewRouter(), viewModel: JuiceMenuViewModel(service: JuiceService()))
    }
}
