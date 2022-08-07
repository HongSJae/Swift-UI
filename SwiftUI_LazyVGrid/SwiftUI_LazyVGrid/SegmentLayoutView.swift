//
//  SegmentLayoutView.swift
//  SwiftUI_LazyVGrid
//
//  Created by 홍승재 on 2022/08/07.
//

import SwiftUI

enum LayoutType: CaseIterable {
    case table, grid, triple
}

extension LayoutType {
    var colums: [GridItem] {
        switch self {
        case .table:
            return [
                GridItem(.flexible())
                ]
        case .grid:
            return [
                GridItem(.flexible()),
                GridItem(.flexible())
                ]
        case .triple:
            return [
                GridItem(.adaptive(minimum: 100))
                ]
        }
    }
}

struct SegmentLayoutView: View {
    
    @State var selectiedLayoutType: LayoutType = .table
    
    var myDummyDatas = myModel.dummyDataArray
    
    var body: some View {
        VStack {
            Picker(selection: $selectiedLayoutType, label: Text("레이아웃 타입"), content: {
                ForEach(LayoutType.allCases, id: \.self, content: { layoutType in
                    switch layoutType {
                    case .table:
                        Image(systemName: "list.dash")
                    case .grid:
                        Image(systemName: "square.grid.2x2.fill")
                    case .triple:
                        Image(systemName: "circle.grid.3x3.fill")
                    }
                })
            })
            .frame(width: 250)
            .pickerStyle(.segmented)
            
            ScrollView {
                LazyVGrid(columns: selectiedLayoutType.colums, content: {
                    ForEach(myDummyDatas) { dataItem in
                        switch selectiedLayoutType {
                        case .table:
                            MyCard(icon: "book.fill", title: "책읽기", Start: "1PM", End: "3PM", bgColor: .green)
                        case .grid:
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(.orange)
                                .frame(height: 200)
                                .overlay(
                                    VStack(spacing: 2) {
                                        Circle()
                                            .frame(height: 100)
                                            .foregroundColor(.yellow)
                                        Spacer()
                                            .frame(height: 10)
                                        Text("\(dataItem.title)")
                                            .font(.system(size: 20))
                                            .bold()
                                        Text("\(dataItem.content)")
                                    }
                                )
                        case .triple:
                            Circle()
                                .foregroundColor(.blue)
                                .frame(height: 100)
                        }
                    }
                })
                .animation(.easeInOut)
                .padding(.horizontal, 10)
            }
        }
    }
}

struct SegmentLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentLayoutView()
    }
}
