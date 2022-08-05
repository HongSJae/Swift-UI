//
//  File.swift
//  SwiftUI_CustomButton
//
//  Created by 홍승재 on 2022/08/05.
//

import SwiftUI

struct MyRotateButtonStyle: ButtonStyle {
    
    var Color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .font(.system(size: 20))
            .foregroundColor(.white)
            .padding()
            .background(Color)
            .cornerRadius(20)
            .rotationEffect(configuration.isPressed ? .degrees(180) : .degrees(0))
    }
}

struct MyRotateButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button {
            print("Button Clicked!")
        } label: {
            Text("호호")
        }
        .buttonStyle(MyRotateButtonStyle(Color: .blue))
    }
}
