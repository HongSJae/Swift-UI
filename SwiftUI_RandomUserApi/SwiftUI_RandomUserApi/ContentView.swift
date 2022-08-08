//
//  ContentView.swift
//  SwiftUI_RandomUserApi
//
//  Created by 홍승재 on 2022/08/08.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var randomuserViewModel = RandomUserViewModel()
    
    var body: some View {
        List(0...10, id: \.self) { index in
            RandomUserView(.getDummy())
        }
//        List(0...100, id: \.self){ index in
//            RandomUserView()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
