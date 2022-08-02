//
//  MyVStack.swift
//  SwiftUI_Stack
//
//  Created by 홍승재 on 2022/08/02.
//

import SwiftUI

struct MyVStack: View {
    var body: some View {
        
        VStack(alignment: .trailing, spacing: 0) {
            
            //Spacer()
            
            Divider()
                .opacity(0)
            //Rectangle()
            //  .frame(height: 0)
            
            Text("글자")
                .font(.system(size: 30))
                .fontWeight(.heavy)
            //  .padding(.bottom, 100)
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
            //  .padding(.vertical, 100)
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.orange)
            Spacer()
                .frame(height: 50)
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.yellow)
            
            //Spacer()
            //Spacer()
        }
        .frame(width: 300)
        .background(.green)
        //.edgesIgnoringSafeArea(.all)
    }
}

struct MyVStack_Previews: PreviewProvider {
    static var previews: some View {
        MyVStack()
    }
}
