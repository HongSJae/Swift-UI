//
//  Myview.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/09.
//

import SwiftUI

struct MyView: View {
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .top) {
                ColorManager.BackgroundColor.ignoresSafeArea()
                VStack {
                    HStack {
                        Text("내 정보")
                            .foregroundColor(.white)
                            .font(.custom("NotoSansKR-Bold", size: 60))
                            .padding(.top, proxy.size.width/7)
                            .padding(.bottom, proxy.size.width/10 - 10)
                            .padding(.leading, 30)
                        Spacer()
                    }
                }
            }
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
            .previewInterfaceOrientation(.portrait)
    }
}

//로그아웃 만들 때 자동로그인 꺼야함.
