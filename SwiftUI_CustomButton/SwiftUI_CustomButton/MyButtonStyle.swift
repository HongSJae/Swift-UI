//
//  File.swift
//  SwiftUI_CustomButton
//
//  Created by 홍승재 on 2022/08/05.
//

import SwiftUI

enum ButtonType {
    case tap
    case long
}

struct MyButtonStyle: ButtonStyle {
    
    var Color: Color
    var type: ButtonType
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .font(.system(size: 20))
            .foregroundColor(.white)
            .padding()
            .background(Color)
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 1.3 : 1)
            .onTapGesture {
                if self.type == .tap {
                    let haptic = UIImpactFeedbackGenerator(style: .light)
                    haptic.impactOccurred()
                }
            }
            .onLongPressGesture {
                if self.type == .long {
                    let haptic = UIImpactFeedbackGenerator(style: .heavy)
                    haptic.impactOccurred()
                }
            }
    }
}

struct MyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button {
            print("Button Clicked!")
        } label: {
            Text("호호")
        }
        .buttonStyle(MyButtonStyle(Color: .blue, type: .tap))
    }
}
