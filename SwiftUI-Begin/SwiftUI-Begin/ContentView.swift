//
//  ContentView.swift
//  SwiftUI-Begin
//
//  Created by 홍승재 on 2022/08/01.
//

import SwiftUI

struct ContentView: View {
    
    //@State 값의 변화를 감지 -> 뷰에 적용
    @State
    private var isActivated = false
    
    //몸체
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    MyVStackView(isActivated: $isActivated)
                    MyVStackView(isActivated: $isActivated)
                    MyVStackView(isActivated: $isActivated)
                    
                } //HStack
                //.padding(10)
                .padding(isActivated ? 50 : 10)
                .background(isActivated ? Color.yellow : Color.black)
                // 탭 재스쳐 추가
                .onTapGesture {
                    print("HStack이 클릭 되었다.")
                    
                    //애니메이션과 함께
                    withAnimation {
                        //toggle() 참/거짓을 바꿈
                        self.isActivated.toggle()
                    }
                } //HStack
                
                //네비게이션 버튼 (링크)
                NavigationLink(destination: MyTextView(isActivated: $isActivated)) {
                    Text("네비게이션")
                        .fontWeight(.bold)
                        .padding()
                        .font(.system(size: 40))
                        .background(.orange)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                } .padding(.top , 50)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
