//
//  JuiceMakingView.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/28.
//

import SwiftUI

struct JuiceMakingView: View {
    var body: some View {
      VStack(spacing: 0) {
        BlnederTop()
          .fill(Color("blenderBlue"))
          .frame(width: 100, height: 40, alignment: .center)
        BlnederMiddle()
          .fill(Color("glassBlue"))
          .frame(width: 100, height: 120, alignment: .center)
        BlnederBottom()
          .fill(Color("blenderBlue"))
          .frame(width: 100, height: 70, alignment: .center)
      }
    }
}

struct JuiceMakingView_Previews: PreviewProvider {
    static var previews: some View {
        JuiceMakingView()
        .previewLayout(.sizeThatFits)
    }
}

struct BlnederTop: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: 0, y: rect.height))
    path.addLine(to: CGPoint(x: rect.width, y: rect.height))
    path.addCurve(to: CGPoint(x: 0, y: rect.height),
                  control1: CGPoint(x: rect.width/10 * 9.5, y: rect.height/10 * 4),
                  control2: CGPoint(x: rect.width/10 * 0.5, y: rect.height/10 * 4))
    return path
  }
}

struct BlnederMiddle: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: 0, y: 0))
    path.addLine(to: CGPoint(x: rect.width/10 * 2, y: rect.height))
    path.addLine(to: CGPoint(x: rect.width/10 * 8, y: rect.height))
    path.addLine(to: CGPoint(x: rect.width, y: 0))
    path.addLine(to: CGPoint(x: rect.width/10, y: 0))
    return path
  }
}

struct BlnederBottom: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: rect.width/10 * 2, y: 0))
    path.addLine(to: CGPoint(x: rect.width/10 * 8, y: 0))
    
    path.addCurve(to: CGPoint(x: rect.width/10 * 9, y: rect.height),
                  control1: CGPoint(x: rect.width/10 * 9.8, y: rect.height/10 * 3 ),
                  control2: CGPoint(x: rect.width, y: rect.height))
    path.addLine(to: CGPoint(x: rect.width/10 * 1, y: rect.height))
    
    path.addCurve(to: CGPoint(x: rect.width/10 * 2, y: 0),
                  control1: CGPoint(x: 0, y: rect.height),
                  control2: CGPoint(x: rect.width/10 * 0.2, y: rect.height/10 * 3 ))
    return path
  }
}
