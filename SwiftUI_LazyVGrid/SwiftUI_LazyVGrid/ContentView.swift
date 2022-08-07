//
//  ContentView.swift
//  SwiftUI_LazyVGrid
//
//  Created by 홍승재 on 2022/08/07.
//

import SwiftUI

struct myModel: Identifiable {
    let id = UUID()
    let title: String
    let content: String
}

extension myModel {
    static var dummyDataArray: [myModel] {
        (1...2000).map{ (number: Int) in
            myModel(title: "타이틀: \(number)", content: "컨텐트: \(number)")
        }
    }
}

struct ContentView: View {
    
    var dummyDataArray = myModel.dummyDataArray
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.fixed(50)),
//                GridItem(.adaptive(minimum: 50)),
                GridItem(.flexible(minimum: 50))
                ], content: {
                    ForEach(dummyDataArray, content: { (dataItem: myModel) in
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(height: 120)
                            .overlay(Text("\(dataItem.title)"))
                })
            })
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
