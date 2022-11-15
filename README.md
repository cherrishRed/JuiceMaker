# 🧃 Juice Maker

## 목차

- [프로젝트 소개](#프로젝트-소개)
- [키워드](#키워드)
- [STEP 1](#step-1)
- [STEP 2](#step-2)
- [STEP 3](#step-3)
- [STEP 4](#step-4)

## 프로젝트 소개

SwiftUI 공부의 일환으로 6개월 전 UIKit 코드의 리펙토링 진행했습니다.
[이전 프로젝트 보기](https://github.com/cherrishRed/ios-juice-maker)

![](https://i.imgur.com/ZALx7zD.png)

**🧃 주스를 주문하세요!**

**🍓 품절이여도 괜찮아요 재고를 수정하세요**

**🪄 나만의 커스텀 주스를 만드세요!**

## 키워드
`SwiftUI` `Combine` `Custom Button` `Animation`

### 🚀 trouble shooting
- 물결 애니메이션 구현
- 데이터 연동

#### 물결 애니메이션 구현
`🤔문제`
음료수가 물결치는 애니메이션이 지속적으로 반복되는 애니메이션을 구현하고 싶었습니다. 
Path를 이용했지만, 자연스러운 애니메이션 부분에 문제가 있었습니다.

`🤗해결`
삼각함수를 이용해 자연스러운 물치는 애니메이션을 구현했습니다. 

```swift
  func path(in rect: CGRect) -> Path {
    return Path { path in
      path.move(to: .zero)
      
      let progressHeight: CGFloat = (1 - progress) * rect.height
      let height = waveHeight * rect.height
      
      for value in stride(from: 0, through: rect.width, by: 2) {
        let x: CGFloat = value
        
        let sine: CGFloat = sin(Angle(degrees: value + offset).radians)/4
        let y: CGFloat = progressHeight + (height * sine)
        path.addLine(to: CGPoint(x: x, y: y))
      }
      
      path.addLine(to: CGPoint(x: rect.width, y: rect.height))
      path.addLine(to: CGPoint(x: 0, y: rect.height))
    }
  }
```

#### 데이터 연동
`🤔문제`
StorageView 에서 과일의 개수를 바꾸고 저장 버튼을 눌렀을 때에만 저장을 하고 싶은데, 양방향 바인딩이기 때문에 개수를 이동하기만 하면 바뀌어 버리는 문제가 있었습니다. 

`🤗해결`
양방향 바인딩을 끊어버리고, Combine을 활용해 단방향 바인딩으로 수정했습니다. 
`saveStock` 이라는 메서드를 만들어, 버튼을 누를 때만 정보가 저장 되도록 변경했습니다. 
```swift
  func subscriberCellCount() {
    for vm in childrenViewModel {
      
      childrenViewModel[vm.key]?.$count
        .sink(receiveValue: { [weak self] amount in
          self?.stock[vm.key] = amount
        })
        .store(in: &cancelable)
    }
  }
  
  func saveStock() {
    $stock
      .sink { [weak self] changedStock in
      self?.service.change(stock: changedStock)
    }
    .store(in: &cancelable)
  }
```
