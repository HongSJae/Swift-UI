//
//  MyTextView.swift
//  SwiftUI-Begin
//
//  Created by 홍승재 on 2022/08/02.
//

import SwiftUI

struct MyTextView: View {
    
    //@State 값의 변화를 감지 -> 뷰에 적용
    @State
    private var index = 0

    @Binding
    var isActivated: Bool
    
    //생성자
    init(isActivated: Binding<Bool> =
        .constant(false)) {
        _isActivated = isActivated
    }
    
    //배경색 배열 준비
    private var BackgroundColors: [Color] = [
        .red,
        .yellow,
        .blue,
        .green,
        .orange,
        .white,
        .brown,
        .gray
    ]
    
    var body: some View{
        VStack {
            
            Spacer()
            
            Text("배경 아이템 인덱스 \(self.index)")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: 100
                )
            Text("활성화 상태: \(String(isActivated))")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(isActivated ? .yellow : .gray)
                .background(.black)
            Spacer()
        }
        .background(BackgroundColors[index])
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            print("배경아이템이 클릭 되었다.")
            if index == BackgroundColors.count - 1 {
                index = 0
            }
            index += 1
        }
    }
}

struct MyTextView_Previews: PreviewProvider {
    static var previews: some View {
        MyTextView()
    }
}

