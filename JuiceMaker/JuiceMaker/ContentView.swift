//
//  ContentView.swift
//  JuiceMaker
//
//  Created by Red on 2022/08/13.
//

import SwiftUI
import Combine

struct ContentView: View {
  @State var page = "JuiceMenuView"
  @ObservedObject var viewRouter: ViewRouter
  @ObservedObject var service: JuiceService
  
  var body: some View {
       VStack {
          if viewRouter.currentPage == "JuiceMenuView" {
            JuiceMenuView(viewRouter: viewRouter, viewModel: JuiceMenuViewModel(service: service))

          } else if viewRouter.currentPage == "StorageView" {
            
            StorageView(viewModel: StorageViewModel(service: service), viewRouter: viewRouter)
            
          } else if viewRouter.currentPage == "CustomJuiceView" {
            
            CustomJuiceView(viewRouter: viewRouter, vm: CustomJuiceViewModel(service: service))
        }
      }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView(viewRouter: ViewRouter(), service: JuiceService())
    }
}

class ViewRouter : ObservableObject{
    
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    var currentPage: String = "CustomJuiceView" {
        didSet{
            objectWillChange.send(self)
        }
    }
}
