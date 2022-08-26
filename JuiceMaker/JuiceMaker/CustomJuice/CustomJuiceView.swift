//
//  CustomJuiceView.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/26.
//

import SwiftUI
import Combine

struct CustomJuiceView: View {
  @ObservedObject var viewRouter: ViewRouter
  var fruits: [Fruit] = Fruit.allCases
  @StateObject var vm: CustomJuiceViewModel = CustomJuiceViewModel()
  
    var body: some View {
      VStack(alignment: .center) {
        // 주스 이름 입력칸
        ZStack {
          RoundedRectangle(cornerRadius: 15)
            .fill(.white)
            .frame(width: 250, height: 50, alignment: .center)
          TextField("주스이름", text: $vm.juiceName)
            .font(Font.custom("BMJUAOTF", size: 24))
            .multilineTextAlignment(.center)
            .frame(width: 230, height: 50, alignment: .center)
        }
        // 색상
        ZStack {
          RoundedRectangle(cornerRadius: 15)
            .fill(vm.selectedColor)
            .frame(width: 250, height: 50, alignment: .center)
          ColorPicker("주스 색상", selection: vm.$selectedColor, supportsOpacity: false)
            .frame(width: 230, height: 50, alignment: .center)
            .font(Font.custom("BMJUAOTF", size: 24))
        }
        // 재료 칸
        ForEach(vm.recipe.indices, id: \.self) { index in
          IngredientView(vm: vm.childrenViewModel[index])
        }
        // 버튼
        Button {
          vm.addNewIngredient()
        } label: {
          Text("PLUS")
            .frame(width: 214)
            .font(Font.custom("BMJUAOTF", size: 20))
        }
        .buttonStyle(SimpleRoundButtonStyle())
      }
      .padding()
      .background(.yellow)
      .animation(.easeInOut, value: vm.recipe.indices)
    }
}



struct CustomJuiceView_Previews: PreviewProvider {
    static var previews: some View {
      CustomJuiceView(viewRouter: ViewRouter())
    }
}

//버튼 스타일
struct SimpleRoundButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding()
      .foregroundColor(configuration.isPressed ? .white : .black)
      .background(configuration.isPressed ? .gray : .white)
      .cornerRadius(15)
  }
}
