//
//  MyCustomTabView.swift
//  SwiftUI_Layout_practice
//
//  Created by 홍승재 on 2022/08/03.
//

import SwiftUI

enum TabIndex {
    case home, cart, profile
}

struct MyCustomTabView: View {
    
    @State var tabIndex = TabIndex.home
    @State var largerScale: CGFloat = 1.6
    
    func changeMyView(tableIndex: TabIndex) -> MyView {
        switch tabIndex {
        case .home:
            return MyView(title: "홈", bgColor: .green)
        case .cart:
            return MyView(title: "장바구니", bgColor: .purple)
        case .profile:
            return MyView(title: "프로필", bgColor: .blue)
        }
    }
    
    func changeIconColor(tableIndex: TabIndex) -> Color {
        switch tabIndex {
        case .home:
            return .green
        case .cart:
            return .purple
        case .profile:
            return .blue
        }
    }
    
    func CalcCircleBgPosition(geometry: GeometryProxy, tableIndex: TabIndex) -> CGFloat {
        switch tabIndex {
        case .home:
            return -(geometry.size.width/3)
        case .cart:
            return 0
        case .profile:
            return (geometry.size.width/3)
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack(alignment: .bottom) {
                    changeMyView(tableIndex: tabIndex)
                    Circle()
                        .frame(width: 90, height: 90)
                        .offset(x: CalcCircleBgPosition(geometry: geometry, tableIndex: tabIndex), y: 15)
                        .foregroundColor(.white)
                    HStack(spacing: 0) {
                        Button {
                            print("홈버튼 클릭")
                            withAnimation {
                                tabIndex = .home
                            }
                        } label: {
                            Image(systemName: "house.fill")
                                .font(.system(size: 25))
                                .scaleEffect(tabIndex == .home ? largerScale : 1)
                                .foregroundColor(self.tabIndex == .home ? changeIconColor(tableIndex: tabIndex) : .gray)
                                .frame(width: geometry.size.width/3, height: 50)
                                .offset(y: tabIndex == .home ? -10 : 0)
                        }
                        .background(.white)
                        Button {
                            print("장바구니 클릭")
                            withAnimation {
                                tabIndex = .cart
                            }
                        } label: {
                            Image(systemName: "cart.fill")
                                .font(.system(size: 25))
                                .scaleEffect(tabIndex == .cart ? largerScale : 1)
                                .foregroundColor(self.tabIndex == .cart ? changeIconColor(tableIndex: tabIndex) : .gray)
                                .frame(width: geometry.size.width/3, height: 50)
                                .offset(y: tabIndex == .cart ? -10 : 0)
                        }
                        .background(.white)

                        Button {
                            print("프로필 클릭")
                            withAnimation {
                                tabIndex = .profile
                            }
                        } label: {
                            Image(systemName: "person.crop.circle.fill")
                                .font(.system(size: 25))
                                .scaleEffect(tabIndex == .profile ? largerScale : 1)
                                .foregroundColor(self.tabIndex == .profile ? changeIconColor(tableIndex: tabIndex) : .gray)
                                .frame(width: geometry.size.width/3, height: 50)
                                .offset(y: tabIndex == .profile ? -10 : 0)
                        }
                        .background(.white)
                    }
                }
                Rectangle()
                    .frame(height:
                            UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 0 : 20)
                    .foregroundColor(.white)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct MyCustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyCustomTabView()
    }
}
