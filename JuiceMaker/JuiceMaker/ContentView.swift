//
//  ContentView.swift
//  JuiceMaker
//
//  Created by Red on 2022/08/13.
//

import SwiftUI

struct ContentView: View {
  @State var index = 0
  let spacing: CGFloat = 10
  let numberOfItems = 10
  let totalMovement: CGFloat = 300 + 10
  @GestureState var offsetState: CGSize = .zero
  
  @State var offset:CGFloat = 0 // -310
  @State var lastOffset: CGFloat = 0
  
  lazy var totalCanvasWidth: CGFloat = CGFloat(300 * numberOfItems) + CGFloat(spacing * CGFloat((numberOfItems - 1)))
  
  lazy var xOffsetToShift = (totalCanvasWidth - UIScreen.main.bounds.width) / 2
  
  var body: some View {
    GeometryReader { proxy in
      HStack(spacing: 10) {
        ForEach(0..<10) { num in
          VStack {
            Text("\(num)")
              .frame(width: 200, height: 20, alignment: .center)
              .padding(.leading, num == 0 ? 30: 0)
            Rectangle()
              .frame(width: 300, height: 300)
              .padding(.leading, num == 0 ? 30: 0)
              .scaleEffect(num == index ? 1.05 : 1)
          }
        }
      }
      .animation(.easeInOut, value: offset)
      .offset(x:offset)
      .gesture(DragGesture()
        .updating($offsetState) { currentState, gestureState, transacton in
          gestureState = currentState.translation
        }
        .onEnded({ gesture in
          if gesture.translation.width > 0 {
            self.offset += 310
            index -= 1
            print(index)
          } else {
            self.offset -= 310
            index += 1
            print(index)
          }
        })
      )
    }
  }
}
                 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}
