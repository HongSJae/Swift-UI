//
//  CircleImageVIew.swift
//  SwiftUI_Image
//
//  Created by 홍승재 on 2022/08/02.
//

import SwiftUI

struct CircleImageVIew: View {
    var body: some View {
//        Image(systemName: "bolt.circle")
//            .font(.system(size: 200))
//            .foregroundColor(.yellow)
//            .shadow(color: .gray, radius: 2, x: 10, y: 10)
        Image("MyImage")
            .resizable()
            .scaledToFill()
//            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 300)
            .clipShape(Circle())
            .shadow(color: .gray, radius: 5, x: 0, y: 10)
        
            .overlay(Circle().foregroundColor(.black).opacity(0.4))
        
            .overlay(Circle().stroke(.purple, lineWidth: 5)
                .padding(10)
            )
            .overlay(Circle().stroke(.black, lineWidth: 8).padding(0)
            )
            .overlay(Text("Mac Book")
                .foregroundColor(.white)
//                .font(.system(size: 20))
                .font(.system(.body, design: .monospaced))
                .fontWeight(.medium)
            )
    }
}

struct CircleImageVIew_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageVIew()
    }
}
