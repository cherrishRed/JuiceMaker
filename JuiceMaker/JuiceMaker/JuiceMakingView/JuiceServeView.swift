//
//  JuiceServeView.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/29.
//

import SwiftUI

struct JuiceServeView: View {
  @State var startAnimation: CGFloat = 0
  @State var animationStart: Bool = false
  var juice: Juice
  
  init(juice: Juice) {
    self.juice = juice
  }
  
  var body: some View {
    VStack(alignment: .center, spacing: 10) {
      JuiceImageView(startAnimation: startAnimation, juice: juice)
        .opacity(animationStart ? 1 : 0)
        .animation(.easeInOut.delay(1), value: animationStart)
        .onAppear {
          animationStart = true
        }

        Text("\(juice.name)")
          .font(Font.custom("BMJUAOTF", size: 36))
          .padding(.top, 30)
          .opacity(animationStart ? 1 : 0)
          .animation(.easeInOut.delay(1.5), value: animationStart)
        Text("나왔습니다")
          .font(Font.custom("BMJUAOTF", size: 24))
          .opacity(animationStart ? 1 : 0)
          .animation(.easeInOut.delay(1.8), value: animationStart)
      
      Button {
        
      } label: {
        Text("마시기")
          .font(Font.custom("BMJUAOTF", size: 24))
      }
      .buttonStyle(MyButtonStyle(backgroundColor: .white, shadowColor: .orange))
      .padding(.top, 30)
      .opacity(animationStart ? 1 : 0)
      .animation(.easeInOut.delay(2.4), value: animationStart)
    }
  }
  
}

struct JuiceServeView_Previews: PreviewProvider {
    static var previews: some View {
        JuiceServeView(juice: Juice(name: "딸바 주스",
                                    recipe: Recipe(ingredient: [.strawberry : 1,
                                                                .banana: 1]),
                                    color: Color("strawberryPink")))
    }
}
