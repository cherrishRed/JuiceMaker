//
//  IngredientView.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/27.
//

import SwiftUI

struct IngredientView: View {
  private let fruits: [Fruit] = Fruit.allCases
  @StateObject var vm: CustomJuiceCellViewModel
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 15)
        .fill(.white)
        .frame(width: 250, height: 50, alignment: .center)
      
      HStack(spacing: 20) {
        Menu {
          Picker(selection: $vm.fruit) {
            ForEach(fruits, id: \.rawValue) { value in
              Text(value.icon)
                .tag(value)
            }
          } label: {}
        } label: {
          Text(vm.fruit.icon)
            .font(Font.custom("TossFaceFontMac", size: 30))
        }.id(vm.fruit)
        
        Text("X")
          .font(Font.custom("BMJUAOTF", size: 30))
        
        Menu {
          Picker(selection: $vm.amount) {
            ForEach(1..<21, id: \.self) { value in
              Text("\(value)")
                .tag(value)
            }
          } label: {}
        } label: {
          Text("\(vm.amount)")
            .font(Font.custom("BMJUAOTF", size: 30))
            .foregroundColor(.black)
        }.id(vm.amount)
      }
      
      }
  }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
      IngredientView(vm: CustomJuiceCellViewModel(fruit: .strawberry, amount: 10))
        .previewLayout(.sizeThatFits)
    }
}
