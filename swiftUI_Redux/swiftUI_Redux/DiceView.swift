//
//  DiceView.swift
//  swiftUI_Redux
//
//  Created by 홍승재 on 2022/08/08.
//
//"⚀","⚁","⚂","⚃","⚄","⚅"

import SwiftUI

struct DiceView: View {
    
    @EnvironmentObject var store: AppStore
    
    @State private var shouldRoll = false
    
    @State private var pressed = false
    
    var DiceRollAnimation: Animation {
        Animation.spring()
    }
    
    func rollTheDice() {
        print(#fileID, #function, #line)
        self.shouldRoll.toggle()
        self.store.dispatch(action: .rollTheDice)
    }
    
    var body: some View {
        VStack {
            Text(self.store.state.currentDice)
                .font(.system(size: 300, weight: .bold, design: .monospaced))
                .foregroundColor(.purple)
                .rotationEffect(.degrees(shouldRoll ? 360 : 0))
                .animation(DiceRollAnimation)
            Button {
                self.rollTheDice()
            } label: {
                Text("랜덤 주사위 굴리기")
                    .fontWeight(.black)
            }
            .buttonStyle(MyButtonStyle())
            .scaleEffect(self.pressed ? 0.8 : 1)
            .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { pressing in
                withAnimation(.easeInOut(duration: 0.2), {
                    self.pressed = pressing
                })
            }, perform: {})
        }
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}
