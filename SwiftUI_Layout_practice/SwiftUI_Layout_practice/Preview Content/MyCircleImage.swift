//
//  MyCircleImage.swift
//  SwiftUI_Layout_practice
//
//  Created by 홍승재 on 2022/08/03.
//

import SwiftUI

struct MyCircleImage: View {
    
    var imageString: String
    
    var body: some View {
        Image(imageString)
            .resizable()
            .frame(width: 250, height: 250)
            .clipShape(Circle())
            .shadow(color: .gray, radius: 10, x: 0, y: 10)
            .overlay(Circle()
                .strokeBorder(
                    .yellow,
                    lineWidth: 15))
    }
}

struct MyCircleImage_Previews: PreviewProvider {
    static var previews: some View {
        MyCircleImage(imageString: "MyGitProfile")
    }
}
