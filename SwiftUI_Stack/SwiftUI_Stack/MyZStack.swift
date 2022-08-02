//
//  MyZStack.swift
//  SwiftUI_Stack
//
//  Created by 홍승재 on 2022/08/02.
//

import SwiftUI

struct MyZStack: View {
    var body: some View {
        
        ZStack {
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundColor(.yellow)
                .zIndex(2)
//                .padding(.bottom, 100)
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
                .zIndex(1)
            Rectangle()
                .frame(width: 150, height: 150)
                .foregroundColor(.blue)
                .zIndex(0)
        }
    }
}

struct MyZStack_Previews: PreviewProvider {
    static var previews: some View {
        MyZStack()
    }
}
