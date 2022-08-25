//
//  StorageView.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/13.
//

import SwiftUI

struct StorageView: View {
  var viewModel: StorageViewModel
  @ObservedObject var viewRouter: ViewRouter
  
  init(viewModel: StorageViewModel, viewRouter: ViewRouter) {
    self.viewModel = viewModel
    self.viewRouter = viewRouter
  }
  
    var body: some View {
      VStack {
        HStack {
          Button {
            viewRouter.currentPage = "JuiceMenuView"
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
            viewModel.saveStock()
            viewRouter.currentPage = "JuiceMenuView"
            
          } label: {
            Text("💾")
          }
          .buttonStyle(NavButtonStyle(backgroundColor: .white, shadowColor: .green))
        }
        .padding()

        List {
          ForEach(viewModel.stock.sorted(by: >), id: \.key) { key, _ in
            StorageCellView(viewModel: viewModel.childrenViewModel[key]!)
          }
        }
      }
    }
}

struct StorageView_Previews: PreviewProvider {
    static var previews: some View {
      StorageView(viewModel: StorageViewModel(service: JuiceService()), viewRouter: ViewRouter())
    }
}
