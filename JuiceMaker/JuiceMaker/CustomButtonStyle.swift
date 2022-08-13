//
//  CustomButtonStyle.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/13.
//

import SwiftUI

struct MyButtonStyle: ButtonStyle {
  private var backgroundColor: Color
  private var shadowColor: Color
  
  init(backgroundColor: Color, shadowColor: Color) {
    self.backgroundColor = backgroundColor
    self.shadowColor = shadowColor
  }
  
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding()
//      .font(Font.custom("BMJUAOTF", size: 24))
      .foregroundColor(shadowColor)
      .background(backgroundColor)
      .border(shadowColor, width: 4)
      .cornerRadius(5)
      .shadow(color: shadowColor, radius: 0, x: 0, y: configuration.isPressed ? 1 : 10)
      .offset(x: 0, y: configuration.isPressed ? 10 : 0)
  }
}

struct NavButtonStyle: ButtonStyle {
  private var backgroundColor: Color
  private var shadowColor: Color
  
  init(backgroundColor: Color, shadowColor: Color) {
    self.backgroundColor = backgroundColor
    self.shadowColor = shadowColor
  }
  
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .font(Font.custom("TossFaceFontMac", size: 24))
      .frame(width: 50, height: 50, alignment: .center)
      .foregroundColor(shadowColor)
      .background(backgroundColor)
      .border(shadowColor, width: 4)
      .cornerRadius(5)
      .shadow(color: shadowColor, radius: 0, x: 0, y: configuration.isPressed ? 1 : 10)
      .offset(x: 0, y: configuration.isPressed ? 10 : 0)
  }
}

struct StepperButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding()
      .foregroundColor(.black)
      .background(configuration.isPressed ? .gray : .white)
      .cornerRadius(5)
  }
}
