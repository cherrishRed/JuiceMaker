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
        .buttonStyle(MyButtonStyle(backgroundColor: .white, shadowColor: .red))
        
        Button {
        } label: {
          Text("메뉴 보기")
        }
        .buttonStyle(MyButtonStyle(backgroundColor: .white, shadowColor: Color.init("storageBrown")))
        
        Button {
        } label: {
          Text("재료 창고")
        }
        .buttonStyle(MyButtonStyle(backgroundColor: .white, shadowColor: Color.init("storageBrown")))
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
