//
//  MyGeometryReader.swift
//  SwiftUI_Layout_practice
//
//  Created by 홍승재 on 2022/08/03.
//

import SwiftUI

struct MyGeometryReader: View {
    var body: some View {
        HStack {
            GeometryReader { geometryReader in
                VStack(spacing: 0) {
                    Text("1")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(height: geometryReader.size.height/3)
                        .foregroundColor(.white)
                        .background(.red)
                    Text("2")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(height: geometryReader.size.height/3)
                        .foregroundColor(.white)
                        .background(.blue)
                    Text("3")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(height: geometryReader.size.height/3)
                        .foregroundColor(.white)
                        .background(.green)
    //                Text("4")
    //                    .font(.largeTitle)
    //                    .fontWeight(.black)
    //                    .frame(width: 10 0)
    //                    .foregroundColor(.white)
    //                    .background(.purple)
                }
//                .background(.yellow)
                .frame(width: geometryReader.size.width, height: geometryReader.size.height, alignment: .center)
            }
            .background(.yellow)
        }
    }
}

struct MyGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        MyGeometryReader()
    }
}
