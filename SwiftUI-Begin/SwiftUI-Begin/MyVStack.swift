//
//  MyVStack.swift
//  SwiftUI-Begin
//
//  Created by 홍승재 on 2022/08/02.
//

import SwiftUI

struct MyVStackView: View {
    
    @Binding
    var isActivated: Bool
    
    //생성자
    init(isActivated: Binding<Bool> =
        .constant(false)) {
        _isActivated = isActivated
    }
    
    var body: some View {
        VStack {
            Text("1!")
                .fontWeight(.bold)
                .font(.system(size: 60))
            Text("2!")
                .fontWeight(.bold)
                .font(.system(size: 60))
            Text("3!")
                .fontWeight(.bold)
                .font(.system(size: 60))
        } //VStack
        .background(isActivated ? .green : .red)
        .padding(isActivated ? 10 : 0)
    }
}

struct MyVStackView_Previews: PreviewProvider {
    static var previews: some View {
        MyVStackView()
    }
}
