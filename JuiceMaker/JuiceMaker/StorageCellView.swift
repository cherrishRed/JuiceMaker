//
//  StorageCellView.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/14.
//

import SwiftUI

struct StorageCellView: View {
  var viewModel: StorageCellViewModel
  
  init(viewModel: StorageCellViewModel) {
    self.viewModel = viewModel
  }
  
    var body: some View {
      VStack(spacing: 0) {
        Text("🍓")
          .font(Font.custom("TossFaceFontMac", size: 48))
        
        HStack {
          Button {
            viewModel.minusFruit()
          } label: {
            Text("<")
          }
          .buttonStyle(StepperButtonStyle())
          
          Spacer()
          
          Text("\(viewModel.count)")
          
          Spacer()
          
          Button {
            viewModel.plusFruit()
          } label: {
            Text(">")
          }
          .buttonStyle(StepperButtonStyle())

        }
        .font(Font.custom("BMJUAOTF", size: 24))
        .padding()
      }
    }
}
