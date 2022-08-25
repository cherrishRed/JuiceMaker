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
  
  var body: some View {
       VStack {
          if viewRouter.currentPage == "JuiceMenuView" {
            JuiceMenuView(viewRouter: viewRouter)
            
          } else if viewRouter.currentPage == "StorageView" {
              StorageView(viewModel: StorageViewModel(), viewRouter: viewRouter)
          }
      }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView(viewRouter: ViewRouter())
    }
}

class ViewRouter : ObservableObject{
    
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    var currentPage: String = "JuiceMenuView" {
        didSet{
            objectWillChange.send(self)
        }
    }
}
