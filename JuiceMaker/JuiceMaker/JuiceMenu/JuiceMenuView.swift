//
//  JuiceMenuView.swift
//  JuiceMaker
//
//  Created by RED on 2022/08/24.
//

import SwiftUI

struct JuiceMenuView: View {
  @State var tag:Int? = nil
  @ObservedObject var viewRouter: ViewRouter
  @ObservedObject var viewModel: JuiceMenuViewModel
  @State var currentIndex: Int = 0
  
  var body: some View {
    ZStack {
      Rectangle()
        .fill(.yellow)
        .ignoresSafeArea()
      VStack(spacing: 50) {
        Text("JuiceMaker")
          .font(Font.custom("BMJUAOTF", size: 36))
          .padding(.top)
        CarouselView(views: viewModel.makeCellViews(menu: viewModel.juices), currentIndex: $currentIndex)
          .frame(height: 400)
          
        
        VStack(spacing: 20) {
          Button {
            viewModel.pushUpMakeButton(index: currentIndex)
          } label: {
            Text("만들기")
              .font(Font.custom("BMJUAOTF", size: 24))
          }
          .buttonStyle(MyButtonStyle(backgroundColor: .white, shadowColor: .red))
          .alert(isPresented: $viewModel.isShowErrorAlert, error: viewModel.error) {
            Button("수정할래요", role: .none) {
              viewRouter.currentPage = "StorageView"
            }
            Button("나중에 할께요", role: .none) { }
          }
          
          Button {
            viewRouter.currentPage = "StorageView"
          } label: {
            Text("📦")
          }
          .buttonStyle(NavButtonStyle(backgroundColor: .white, shadowColor: Color("storageBrown")))
        }
      }
    }
  }
}

struct JuiceMenuView_Previews: PreviewProvider {
    static var previews: some View {
      JuiceMenuView(viewRouter: ViewRouter(), viewModel: JuiceMenuViewModel(service: JuiceService(), viewRouter: ViewRouter()))
    }
}

struct NewRecipeButtonView : View {
  @ObservedObject var viewRouter: ViewRouter
  var body: some View {
    Button {
      viewRouter.currentPage = "CustomJuiceView"
    } label: {
      Text("나만의 \n새로운 주스 레시피\n등록하기!")
        .font(Font.custom("BMJUAOTF", size: 24))
        .multilineTextAlignment(.center)
    }
    .buttonStyle(MyButtonStyle(backgroundColor: .white, shadowColor: .red))
  }
}
