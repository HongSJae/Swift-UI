//
//  TestView.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/26.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        GeometryReader { GeometryProxy in
            ZStack(alignment: .leading) {
                Text("전공동아리")
                    .font(.custom("NotoSansKR-Bold", size: 25))
                    .foregroundColor(.black)
                    .frame(width: GeometryProxy.size.width - 100,
                           height: GeometryProxy.size.height / 11)
                    .background(Color("ScheduleGrayColor"))
                    .cornerRadius(10)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 50)
                Text("10교시")
                    .font(.custom("NotoSansKR-Regular", size: 15))
                    .foregroundColor(.black)
                    .padding(.leading, GeometryProxy.size.width / 5)
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
