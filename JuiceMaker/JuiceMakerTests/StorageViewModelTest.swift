//
//  StorageViewModelTest.swift
//  JuiceMakerTests
//
//  Created by RED on 2022/09/04.
//

import XCTest
@testable import JuiceMaker

class StorageViewModelTest: XCTestCase {
  var sut: StorageViewModel!
  var service: mockServiceprotocol
  
    override func setUpWithError() throws {
      sut = StorageViewModel(service: JuiceService())
    }

    override func tearDownWithError() throws {
      sut = nil
    }
  
    func test_subscriberCellCount호출시() {
    
    }
  
    func test_saveStock호출시() {
      //strawberry 개수를 12 개에서 1개로 변경
      sut.stock[.strawberry] = 1
      //
      sut.saveStock()
      //
      let result = sut.service.stock[.strawberry]
      XCTAssertEqual(1, result)
    }
}
