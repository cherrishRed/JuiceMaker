//
//  StorageCellView.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/14.
//

import SwiftUI

struct StorageCellView: View {
    var body: some View {
      VStack(spacing: 0) {
        Text("🍓")
          .font(Font.custom("TossFaceFontMac", size: 48))
        
        HStack {
          Button {
            
          } label: {
            Text("<")
          }
          .buttonStyle(StepperButtonStyle())
          
          Spacer()
          
          Text("12")
          
          Spacer()
          
          Button {
            
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

struct StorageCellView_Previews: PreviewProvider {
    static var previews: some View {
        StorageCellView()
        .previewLayout(.sizeThatFits)
    }
  
}
