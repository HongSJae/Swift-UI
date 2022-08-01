//
//  ContentView.swift
//  SwiftUI-Begin
//
//  Created by 홍승재 on 2022/08/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack {
            
            MyVStackView()
            MyVStackView()
            MyVStackView()
            
        } //HStack
//        .padding(10)
        .padding(.all, 10)
        .background(Color.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
