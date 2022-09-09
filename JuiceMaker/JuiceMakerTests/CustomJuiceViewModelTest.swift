//
//  CustomJuiceViewModelTest.swift
//  JuiceMakerTests
//
//  Created by RED on 2022/09/09.
//

import XCTest
@testable import JuiceMaker

class CustomJuiceViewModelTest: XCTestCase {
  let spyJuiceService = SpyJuiceService()
  var sut: CustomJuiceViewModel!

    override func setUpWithError() throws {
      sut = CustomJuiceViewModel(service: spyJuiceService)
    }

    override func tearDownWithError() throws {
      sut = nil
    }
  
  func test_addNewIngredient호출시_레시피가_변경되고_자식뷰모델을_생성하는지() {
    // given
    let expectIngredient: (Fruit, Int) = (.strawberry, 1)
    let expectViewModel = IngredientViewModel(fruit: .strawberry, amount: 1)
    
    // when
    sut.addNewIngredient()
    let newIngredient = sut.recipe[1]
    let newChildrenViewModel = sut.childrenViewModel[1]
    
    // then
    XCTAssertEqual(expectIngredient.0, newIngredient.0)
    XCTAssertEqual(expectIngredient.1, newIngredient.1)
    XCTAssertEqual(expectViewModel.amount, newChildrenViewModel.amount)
    XCTAssertEqual(expectViewModel.fruit, newChildrenViewModel.fruit)
  }
  
  func test_saveNewJuiceRecipe호출시_테스트주스가_저장되는지() {
    // given
    let juice = Juice(name: "테스트 주스", recipe: .init(ingredient: [.kiwi: 3]), color: .green)
    
    sut.juiceName = "테스트 주스"
    sut.recipe = [(.kiwi, 3)]
    sut.selectedColor = .green
    // when
    sut.saveNewJuiceRecipe()
    
    // then
    let result = spyJuiceService.juices[0]
    XCTAssertEqual(juice.name, result.name)
    XCTAssertEqual(juice.recipe.ingredient, result.recipe.ingredient)
    XCTAssertEqual(juice.color, result.color)
  }

}

final class SpyJuiceService: JuiceServiceable {
  var juices: [Juice] = []
  
  func plusStock(fruit: Fruit) {
    //
  }
  
  func minusStock(fruit: Fruit, count: Int) {
    //
  }
  
  func addNewJuice(_ juice: Juice) {
    juices.append(juice)
  }
  
  func makeJuice(_ juice: Juice) -> Result<Juice, MakeJuiceError> {
    return .success(Juice(name: "", recipe: .init(ingredient: [:]), color: .red))
  }
  
  func change(stock: [Fruit : Int]) {
    //
  }
}
