//
//  MyTabView.swift
//  SwiftUI_Layout_practice
//
//  Created by 홍승재 on 2022/08/03.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        TabView {
            MyView(title: "1번", bgColor: .red)
                .tabItem {
                    Image(systemName: "airplane")
                    Text("1번")
                }
                .tag(0)
                
            MyView(title: "2번", bgColor: .orange)
                .tabItem {
                    Image(systemName: "flame.fill")
                    Text("2번")
                }
                .tag(1)
                .padding(.bottom)
            MyView(title: "3번", bgColor: .blue)
                .tabItem {
                    Image(systemName: "doc.fill")
                    Text("3번")
                }
                .tag(2)
                .padding(.bottom)
        }
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
