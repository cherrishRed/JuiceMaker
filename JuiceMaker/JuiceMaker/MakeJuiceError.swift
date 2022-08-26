//
//  MakeJuiceError.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/26.
//

import Foundation

enum MakeJuiceError: LocalizedError {
  case OutOfStockError
  case NoneKeyError
  
  var errorDescription: String? {
    switch self {
    case .OutOfStockError:
      return "재고가 부족해요🥲 \n 창고에 수정하러 갈까요?"
    case .NoneKeyError:
      return "키 값이 없어요🤯"
    }
  }
}
