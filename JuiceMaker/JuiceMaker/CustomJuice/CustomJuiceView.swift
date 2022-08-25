//
//  CustomJuiceView.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/26.
//

import SwiftUI
import Combine
//viewModel 로 다 저장 되도록 하고 싶다...
// 클래스를 넘기는 것을 생각해보자.

struct CustomJuiceView: View {
  @ObservedObject var viewRouter: ViewRouter
  @State var juiceName: String
  var fruits: [Fruit] = Fruit.allCases
  @StateObject var vm: CustomJuiceViewModel = CustomJuiceViewModel()
//  @State var recipe: [Fruit: Int] = [.strawberry: 1]
//  @State var amount: Int = 1
//  @State var ingredientNumber: Int = 1
  
    var body: some View {
      VStack(alignment: .center) {
        // 주스 이름 입력칸
        ZStack {
          RoundedRectangle(cornerRadius: 15)
            .fill(.white)
            .frame(width: 250, height: 50, alignment: .center)
          TextField("주스이름", text: $juiceName)
            .frame(width: 230, height: 50, alignment: .center)
        }
        // 재료 칸
//        viewModel.fruits.sorted(by: >), id: \.key
        
        ForEach(vm.recipe.ingredient.sorted(by: >), id: \.key) { (fruit, count) in
          IngredientView(fruit: fruit, amount: count)
        }
        
        // 버튼
        Button {
          vm.recipe.ingredient[.apple] = 1
        } label: {
          Text("PLUS")
            .frame(width: 214)
            .font(Font.custom("BMJUAOTF", size: 20))
        }
        .buttonStyle(SimpleRoundButtonStyle())
        }
      .padding()
      .background(.yellow)
//      .animation(.easeInOut, value: ingredientNumber)
    }
}



struct IngredientView: View {
  private let fruits: [Fruit] = Fruit.allCases
  @State var fruit: Fruit
  @State var amount: Int
//  var vm: CustomJuiceCellViewModel
//
  init(fruit: Fruit, amount: Int) {
    self.fruit = fruit
    self.amount = amount
  }
//
//  init(vm: CustomJuiceCellViewModel) {
//    self.vm = vm
//  }
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 15)
        .fill(.white)
        .frame(width: 250, height: 50, alignment: .center)
      
      HStack(spacing: 20) {
        Menu {
          Picker(selection: $fruit) {
            ForEach(fruits, id: \.rawValue) { value in
              Text(value.icon)
                .tag(value)
            }
          } label: {}
        } label: {
          Text(fruit.icon)
            .font(Font.custom("TossFaceFontMac", size: 30))
        }.id(fruit)
        
        Text("X")
          .font(Font.custom("BMJUAOTF", size: 30))
        
        Menu {
          Picker(selection: $amount) {
            ForEach(1..<21, id: \.self) { value in
              Text("\(value)")
                .tag(value)
            }
          } label: {}
        } label: {
          Text("\(amount)")
            .font(Font.custom("BMJUAOTF", size: 30))
            .foregroundColor(.black)
        }.id(amount)
      }
      
      }
  }
}

struct CustomJuiceView_Previews: PreviewProvider {
    static var previews: some View {
      CustomJuiceView(viewRouter: ViewRouter(), juiceName: "")
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

class CustomJuiceViewModel: ObservableObject {
//  let objectWillChange = PassthroughSubject<CustomJuiceViewModel,Never>()
  
//  let children: [CustomJuiceCellViewModel] = [CustomJuiceCellViewModel(fruit: .banana, amount: 1)]
  
  var recipe = Recipe(ingredient: [.strawberry: 1])
  
  func addNewIngredient() {
    recipe.ingredient[.banana] = 1
  }
  
  func changeFruit(oldKey: Fruit, newKey: Fruit) {
    let count = recipe.ingredient[oldKey]
    recipe.ingredient[oldKey] = nil
    recipe.ingredient[newKey] = count
  }
  
}

class CustomJuiceCellViewModel: ObservableObject {
  @Published var fruit: Fruit
  @Published var amount: Int
  
  init(fruit: Fruit, amount: Int) {
    self.fruit = fruit
    self.amount = amount
  }

}

//class ViewRouter : ObservableObject{
//
//    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
//
//    var currentPage: String = "JuiceMenuView" {
//        didSet{
//            objectWillChange.send(self)
//        }
//    }
//}

//init(amount: Binding<CGFloat>) {
//  self._amount = amount
//}
