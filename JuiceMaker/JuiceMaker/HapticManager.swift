//
//  HapticManager.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/28.
//

import SwfitUI

class HapticManager {
  static let instance = HapticManager()
  
  func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
      
      let generator = UINotificationFeedbackGenerator()
      generator.notificationOccurred(type)
  }
  
  func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
      let generator = UIImpactFeedbackGenerator(style: style)
      generator.impactOccurred()
  }
}
