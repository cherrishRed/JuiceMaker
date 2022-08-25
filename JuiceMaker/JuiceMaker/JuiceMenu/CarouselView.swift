//
//  CarouselView.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/23.
//

import SwiftUI

struct CarouselView: View {
  var views: [AnyView]
  let spacing: CGFloat
  let sideCard: CGFloat
  let focusScale: CGFloat
  @State var currentIndex = 0
  @GestureState var offsetState: CGSize = .zero
  @State var offset:CGFloat = 0
  
  init(views: [AnyView],
       spacing: CGFloat = 20,
       sideCard: CGFloat = 30,
       focusScale: CGFloat = 1.1) {
    self.views = views
    self.spacing = spacing
    self.sideCard = sideCard
    self.focusScale = focusScale
  }
  
  var body: some View {
    GeometryReader { proxy in
      let cardSize = proxy.size.width - ((sideCard + spacing) * 2)
      HStack(spacing: 20) {
        ForEach(0..<views.count) { i in
          views[i]
            .frame(width: cardSize, height: 400)
            .padding(.leading, i == 0 ? sideCard + spacing: 0)
            .scaleEffect(i == currentIndex ? focusScale : 1)
        }
      }
      .animation(.interpolatingSpring(stiffness: 50, damping: 10), value: currentIndex)
      .animation(.interpolatingSpring(stiffness: 50, damping: 10), value: offset)
      .offset(x:offset)
      .gesture(DragGesture()
        .updating($offsetState) { currentState, gestureState, transacton in
          gestureState = currentState.translation
        }
        .onEnded({ gesture in
          if gesture.translation.width > 0 {
            previousIndex(cardSize: cardSize)
          } else {
            nextIndex(cardSize: cardSize)
          }

          if currentIndex == -1 {
            nextIndex(cardSize: cardSize)
          }

          if currentIndex == views.count {
            previousIndex(cardSize: cardSize)
          }
        })
      )
    }
  }
  
  private func nextIndex(cardSize: CGFloat) {
    self.offset -= (cardSize + spacing)
    currentIndex += 1
  }
  
  private func previousIndex(cardSize: CGFloat) {
    self.offset += (cardSize + spacing)
    currentIndex -= 1
  }
}
                 
struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
      CarouselView(views: [AnyView(Rectangle()),
                          AnyView(Rectangle()),
                          AnyView(Rectangle())])
    }
}
