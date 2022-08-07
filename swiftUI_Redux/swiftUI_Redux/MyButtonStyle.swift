//
//  MyButtonStyle.swift
//  swiftUI_Redux
//
//  Created by 홍승재 on 2022/08/08.
//

import SwiftUI

struct MyButtonStyle: ButtonStyle {
    
    //
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.system(size: 20))
           .padding()
           .background(.orange)
           .foregroundColor(Color.white)
           .cornerRadius(20)
    }
}

struct MyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            
        }, label: {
            Text("하하하")
                .fontWeight(.heavy)
        }).buttonStyle(MyButtonStyle())
    }
}
