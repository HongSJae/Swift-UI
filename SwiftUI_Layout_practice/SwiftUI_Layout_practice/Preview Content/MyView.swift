//
//  MyVIew.swift
//  SwiftUI_Layout_practice
//
//  Created by 홍승재 on 2022/08/03.
//

import SwiftUI

struct MyView: View {
    
    var title: String
    
    var bgColor: Color
    
    var body: some View {
        ZStack {
            bgColor.edgesIgnoringSafeArea(.all)
            Text(title)
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.white)
        }
        .animation(.none)
    }
}
 
struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView(title: "1번", bgColor: .orange)
    }
}
