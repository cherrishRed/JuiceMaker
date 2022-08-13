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
        Text("재료 창고")
          
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
