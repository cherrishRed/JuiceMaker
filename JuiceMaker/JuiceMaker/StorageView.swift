//
//  StorageView.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/13.
//

import SwiftUI

struct StorageView: View {
  var viewModel: StorageViewModel
  
    var body: some View {
      VStack {
        HStack {
          Button {
          } label: {
            Text("❌")
          }
          .buttonStyle(NavButtonStyle(backgroundColor: .white, shadowColor: .red))
          
          Spacer()
          
          Text("재료 창고")
            .font(Font.custom("BMJUAOTF", size: 36))
            .padding()
          
          Spacer()
          
          Button {
          } label: {
            Text("💾")
          }
          .buttonStyle(NavButtonStyle(backgroundColor: .white, shadowColor: .green))
        }
        .padding()

        List {
          ForEach(viewModel.fruits.sorted(by: >), id: \.key) { key, value in
            
            StorageCellView(viewModel: StorageCellViewModel(fruit: key, count: value))
            
          }
        }
      }
    }
}

struct StorageView_Previews: PreviewProvider {
    static var previews: some View {
        StorageView(viewModel: StorageViewModel())
    }
}
