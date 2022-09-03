//
//  StorageCellViewModelTest.swift
//  JuiceMakerTests
//
//  Created by RED on 2022/09/04.
//

import XCTest
@testable import JuiceMaker

class StorageCellViewModelTest: XCTestCase {
  var sut: StorageCellViewModel!

    override func setUpWithError() throws {
      sut = StorageCellViewModel(fruit: .strawberry, count: 3)
    }

    override func tearDownWithError() throws {
      sut = nil
    }
  
  func test_plusFruit호출시_count가_잘_증가하는지() {
    // given count == 3
    
    // when
    sut.plusFruit()
    let result = sut.count
    // then
    XCTAssertEqual(4, result)
  }
  
  func test_minusFruit호출시_count가_잘_증가하는지() {
    // given count == 3
    
    // when
    sut.minusFruit()
    let result = sut.count
    // then
    XCTAssertEqual(2, result)
  }
}
