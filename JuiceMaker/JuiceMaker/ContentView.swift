//
//  ContentView.swift
//  JuiceMaker
//
//  Created by Red on 2022/08/13.
//

import SwiftUI

struct ContentView: View {
  let mockData = JuiceMaker()
  
  var body: some View {
    ZStack {
      Rectangle()
        .fill(.yellow)
        .ignoresSafeArea()
      VStack(spacing: 50) {
        Text("JuiceMaker")
          .font(Font.custom("BMJUAOTF", size: 36))
          .padding()
        CarouselView(views: makeCellViews(menu: mockData.menu))
          .frame(height: 400)
        Button {
        
        } label: {
          Text("만들기")
            .font(Font.custom("BMJUAOTF", size: 24))
        }
        .buttonStyle(MyButtonStyle(backgroundColor: .white, shadowColor: .red))

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
                 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}
