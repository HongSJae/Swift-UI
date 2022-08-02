//
//  MyList.swift
//  SwiftUI_Layout_practice
//
//  Created by 홍승재 on 2022/08/02.
//

import SwiftUI

struct MyList: View {
    
    var body: some View {
        
        List {
            
            Section(header: Text("오늘 할 일")
                .font(.headline)
                .foregroundColor(.black),
            footer: Text("footer")) {
                ForEach(1...3, id: \.self) {
    //                Text("MyList \($0)")
                    MyCard(icon: "gamecontroller.fill",
                           title: "롤 \($0)판하기",
                           Start: "12 AM",
                           End: "2 AM",
                           bgColor: .red)
                }
            }
            .listRowInsets(EdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            
            Section(header: Text("내일 할 일")
                .font(.headline)
                .foregroundColor(.black),
            footer: Text("footer")) {
                ForEach(1...3, id: \.self) {
    //                Text("MyList \($0)")
                    MyCard(icon: "gamecontroller.fill",
                           title: "롤 \($0)판하기",
                           Start: "12 AM",
                           End: "2 AM",
                           bgColor: .orange)
                }
            }
            .listRowInsets(EdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            .listRowBackground(Color.yellow)
        }
        .listStyle(.grouped)
        .navigationTitle("내 목록")
    }
}

struct MyList_Previews: PreviewProvider {
    static var previews: some View {
        MyList()
            .previewInterfaceOrientation(.portrait)
    }
}
