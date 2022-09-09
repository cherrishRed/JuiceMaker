//
//  JuiceServiceTest.swift
//  JuiceMakerTests
//
//  Created by 박세리 on 2022/09/09.
//

import XCTest
@testable import JuiceMaker

class JuiceServiceTest: XCTestCase {
  var sut: JuiceService!

    override func setUpWithError() throws {
      sut = JuiceService()
    }

    override func tearDownWithError() throws {
       sut = nil
    }
  
  func test_plusStock호출시_망고의개수가_8이되는지() {
    // given
    // 망고는 7개
    let expectResult: Int = 8
    
    // when
    sut.plusStock(fruit: .mango)
    
    let result = sut.stock[.mango]
    // then
    XCTAssertEqual(expectResult, result)
  }
  
  func test_minusStock호출시_망고의개수가_6이되는지() {
    // given
    // 망고는 7개
    let expectResult: Int = 6
    
    // when
    sut.minusStock(fruit: .mango)
    let result = sut.stock[.mango]
    // then
    XCTAssertEqual(expectResult, result)
  }
  
  func test_addNewJuice호출시_테스트주스가_추가되는지() {
    // given
    let expectResult = Juice(name: "테스트 주스", recipe: .init(ingredient: [.kiwi: 3]), color: .green)
    
    // when
    sut.addNewJuice(expectResult)
    
    let result = sut.juices.last!
    // then
    XCTAssertEqual(expectResult.name, result.name)
    XCTAssertEqual(expectResult.recipe.ingredient, result.recipe.ingredient)
    XCTAssertEqual(expectResult.color, result.color)
  }
  
  func test_makeJuice호출시_테스트주스를_성공적으로_반환하고_stock이_변경되는지() {
    // given
    let testJuice = Juice(name: "테스트 주스", recipe: .init(ingredient: [.mango: 3]), color: .yellow)
    
    let expectStock: Int = 4
    
    let result = sut.makeJuice(testJuice)
    
    // then
    switch result {
    case .success(let juice):
      XCTAssertEqual(testJuice.name, juice.name)
      XCTAssertEqual(testJuice.recipe.ingredient, juice.recipe.ingredient)
      XCTAssertEqual(testJuice.color, juice.color)
    case .failure(_):
      XCTFail()
    }
    
    XCTAssertEqual(expectStock, sut.stock[.mango]!)
  }
  
  func test_makeJuice호출시_제고부족오류를_반환하는지() {
    // given
    let testJuice = Juice(name: "테스트 주스", recipe: .init(ingredient: [.mango: 10]), color: .yellow)
    let expectResult: MakeJuiceError = .OutOfStockError
    // when
    let result = sut.makeJuice(testJuice)
    
    // then
    switch result {
    case .success(_):
      XCTFail()
    case .failure(let error):
      XCTAssertEqual(expectResult, error)
    }
  }
  
  func test_change호출시_stock이_변하는지() {
    // given
    let expectResult = 10
    // when
    sut.change(stock: [.mango: 10])
    // then
    let result = sut.stock[.mango]
    XCTAssertEqual(expectResult, result)
  }

}
