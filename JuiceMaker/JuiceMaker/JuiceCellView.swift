//
//  JuiceCellView.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/14.
//

import SwiftUI

struct JuiceCellView: View {
  @State var startAnimation: CGFloat = 0
  
    var body: some View {
      VStack(spacing: 20) {
        juiceImageView
          .padding()
        Text("딸기 주스")
          .font(Font.custom("BMJUAOTF", size: 40))
        ingrdientView
        
      }
    }
}

extension JuiceCellView {
  var ingrdientView: some View {
    HStack {
      Text("🍓")
        .font(Font.custom("TossFaceFontMac", size: 30))
      Group {
        Text("x")
        Text("12")
      }
      .font(Font.custom("BMJUAOTF", size: 30))
    }
  }
}

extension JuiceCellView {
  var juiceImageView: some View {
    ZStack {
      CupShape()
        .stroke(.gray, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
          .frame(width: 120, height: 120)
      
      CupShape()
        .fill(.gray)
          .frame(width: 120, height: 120)
      
      WaterWave(progress: 0.8, waveHeight: 0.3, offset: startAnimation)
        .fill(.pink)
        .frame(width: 110, height: 110)
        .mask {
          CupShape()
            .fill(.gray)
              .frame(width: 110, height: 110)
        }
    }
    .onAppear {
      withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
        startAnimation = 360
      }
  }
}
}

struct CupShape: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: rect.width/10, y: 0))
    path.addLine(to: CGPoint(x: rect.width/10 * 2, y: rect.height))
    path.addLine(to: CGPoint(x: rect.width/10 * 8, y: rect.height))
    path.addLine(to: CGPoint(x: rect.width/10 * 9, y: 0))
    path.addLine(to: CGPoint(x: rect.width/10, y: 0))
    return path
  }
}

struct WaterWave: Shape {
  var progress: CGFloat
  var waveHeight: CGFloat
  var offset: CGFloat
  
  var animatableData: CGFloat {
    get {offset}
    set {offset = newValue}
  }
  
  func path(in rect: CGRect) -> Path {
    return Path { path in
      path.move(to: .zero)
      
      let progressHeight: CGFloat = (1 - progress) * rect.height
      let height = waveHeight * rect.height
      
      for value in stride(from: 0, through: rect.width, by: 2) {
        let x: CGFloat = value
        
        let sine: CGFloat = sin(Angle(degrees: value + offset).radians)/4
        let y: CGFloat = progressHeight + (height * sine)
        path.addLine(to: CGPoint(x: x, y: y))
      }
      
      path.addLine(to: CGPoint(x: rect.width, y: rect.height))
      path.addLine(to: CGPoint(x: 0, y: rect.height))
    }
  }
}

struct JuiceCellView_Previews: PreviewProvider {
    static var previews: some View {
        JuiceCellView()
    }
}

