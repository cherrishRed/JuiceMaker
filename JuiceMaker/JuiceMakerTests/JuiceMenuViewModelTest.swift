//
//  JuiceMenuViewModelTest.swift
//  JuiceMakerTests
//
//  Created by RED on 2022/09/09.
//

import XCTest
@testable import JuiceMaker

class JuiceMenuViewModelTest: XCTestCase {
  var sut: JuiceMenuViewModel!
  let spyJuiceService = SpyJuiceService()

    override func setUpWithError() throws {
      sut = JuiceMenuViewModel(service: spyJuiceService, viewRouter: ViewRouter())
    }

    override func tearDownWithError() throws {
      sut = nil
    }
  
  func test_pushUpMakeButton호출시_성공할때() {
    // given
    let successJuice = Juice(name: "성공주스", recipe: .init(ingredient: [.kiwi: 3]), color: .green)
    
    sut.juices.append(successJuice)
    // when
    sut.pushUpMakeButton(index: 0)
    let resultjuice = sut.juice
    
    // then
    XCTAssertEqual(successJuice.name, resultjuice.name)
  }
  
  func test_pushUpMakeButton호출시_실패할때() {
    // given
    let outOfStockJuice = Juice(name: "재고부족", recipe: .init(ingredient: [.kiwi: 3]), color: .red)
    let expectedError = MakeJuiceError.OutOfStockError
    sut.juices.append(outOfStockJuice)
    // when
    sut.pushUpMakeButton(index: 0)
    
    let resultError = sut.error
    // then
    XCTAssertEqual(expectedError, resultError)
  }
  
//  func test_makeCellViews() {
//  }
}
