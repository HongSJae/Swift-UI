//
//  MyPicker.swift
//  SwiftUI_Picker
//
//  Created by 홍승재 on 2022/08/07.
//

import SwiftUI

struct MyPicker: View {
    @State private var selectionValue = 0
    
    let MyColorArray = ["레드", "그린", "블루"]
    
    func ChangeColor(index: Int) -> Color {
        switch index {
        case 0:
            return .red
        case 1:
            return .green
        case 2:
            return .blue
        default:
            return .red
        }
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(ChangeColor(index: selectionValue))
            Text("세그먼트 value : \(selectionValue)")
            Text("선택된 색깔 : \(MyColorArray[selectionValue])")
            Picker("", selection: $selectionValue) {
                Text("레드")
                    .tag(0)
                Text("그린")
                    .tag(1)
                Text("블루")
                    .tag(2)
            }
            .pickerStyle(.segmented)
            Picker("", selection: $selectionValue) {
                Text("레드")
                    .tag(0)
                Text("그린")
                    .tag(1)
                Text("블루")
                    .tag(2)
            }
            .pickerStyle(.wheel)
            .frame(width: 50, height: 100)
            .clipped()
            .padding()
            .border(ChangeColor(index: selectionValue), width: 10)
        }
        .padding(50)
    }
}

struct MyPicker_Previews: PreviewProvider {
    static var previews: some View {
        MyPicker()
    }
}
