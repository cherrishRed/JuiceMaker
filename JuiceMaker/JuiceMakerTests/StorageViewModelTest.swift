 //
//  StorageViewModelTest.swift
//  JuiceMakerTests
//
//  Created by RED on 2022/09/09.
//

import XCTest
@testable import JuiceMaker

class StorageViewModelTest: XCTestCase {
    var sut: StorageViewModel!
    let spyJuiceService = SpyJuiceService()
  
    override func setUpWithError() throws {
      spyJuiceService.stock = [.kiwi: 2]
      sut = StorageViewModel(service: spyJuiceService)
    }

    override func tearDownWithError() throws {
      sut = nil
    }

  func test_subscriberCellCount호출시() {
    // given
    let expectResult = 2
    // when
    sut.subscriberCellCount()
    let result = sut.stock[.kiwi]!
    // then
    XCTAssertEqual(expectResult, result)
  }
  
  func test_saveStock() {
    // given
    let expectResult: [Fruit: Int] = [.kiwi: 2]
    // when
    sut.saveStock()
    // then
    let result = spyJuiceService.stock
    XCTAssertEqual(expectResult, result)
  }
}
