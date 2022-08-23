//
//  JuiceMenuView.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/24.
//

import SwiftUI

struct JuiceMenuView: View {
  @State var tag:Int? = nil
  let mockData = JuiceMaker()
  @ObservedObject var viewRouter: ViewRouter
  
  var body: some View {
    ZStack {
      Rectangle()
        .fill(.yellow)
        .ignoresSafeArea()
      VStack(spacing: 50) {
        Text("JuiceMaker")
          .font(Font.custom("BMJUAOTF", size: 36))
          .padding(.top)
        CarouselView(views: makeCellViews(menu: mockData.menu))
        
        VStack(spacing: 20) {
          Button {
            
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
        JuiceMenuView(viewRouter: ViewRouter())
    }
}
