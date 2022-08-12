//
//  ContentView.swift
//  JuiceMaker
//
//  Created by Red on 2022/08/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      VStack(spacing: 30) {
        Button {
        } label: {
          Text("주스 주문 하기")
        }
        .buttonStyle(MyButtonStyle())
        
        Button {
        } label: {
          Text("메뉴 보기")
        }
        .buttonStyle(MyButtonStyle())
        
        Button {
        } label: {
          Text("재료 창고")
        }
        .buttonStyle(MyButtonStyle())
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
