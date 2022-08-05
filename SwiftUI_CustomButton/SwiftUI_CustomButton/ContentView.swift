//
//  ContentView.swift
//  SwiftUI_CustomButton
//
//  Created by 홍승재 on 2022/08/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            Button {
                print(("Button Clicekd!"))
            } label: {
                Text("탭")
                    .fontWeight(.bold)
            }
            .buttonStyle(MyButtonStyle(Color: .blue, type: .tap))
            Button {
                print(("Button Clicekd!"))
            } label: {
                Text("롱클릭")
                    .fontWeight(.bold)
            }
            .buttonStyle(MyButtonStyle(Color: .green, type: .long))
            Button {
                print(("Button Clicekd!"))
            } label: {
                Text("축소버튼")
                    .fontWeight(.bold)
            }
            .buttonStyle(MySmallerButtonStyle(Color: .purple))
            Button {
                print(("Button Clicekd!"))
            } label: {
                Text("회전버튼")
                    .fontWeight(.bold)
            }
            .buttonStyle(MyRotateButtonStyle(Color: .pink))
            Button {
                print(("Button Clicekd!"))
            } label: {
                Text("블러버튼")
                    .fontWeight(.bold)
            }
            .buttonStyle(MyBlurButtonStyle(Color: .black))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
