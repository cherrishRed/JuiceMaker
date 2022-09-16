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
            let juiceMenuViewModel = JuiceMenuViewModel(service: service, viewRouter: viewRouter)
            
            JuiceMenuView(viewRouter: viewRouter, viewModel: juiceMenuViewModel)
              .alert("\(viewRouter.juice.name) 나왔습니다! "
                     , isPresented: $viewRouter.isShowSuccessAlert) {
                Button("잘 먹겠습니다.", role: .none) {
                }
              }

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
    @Published var isShowSuccessAlert: Bool = false
    @Published var juice: Juice = Juice(name: "잘못된 주스", recipe: Recipe(ingredient: [.strawberry: 10]), color: Color("strawberryPink"))
    
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    var currentPage: String = "JuiceMenuView" {
        didSet{
            objectWillChange.send(self)
        }
    }
}
