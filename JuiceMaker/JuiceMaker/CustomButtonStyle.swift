//
//  CustomButtonStyle.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/13.
//

import SwiftUI

struct MyButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding()
      .foregroundColor(.brown)
      .background(.yellow)
      .border(.green, width: 4)
      .cornerRadius(5)
      .shadow(color: .green, radius: 0, x: 0, y: configuration.isPressed ? 1 : 10)
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
