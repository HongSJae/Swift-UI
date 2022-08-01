//
//  MyNavigationLink.swift
//  SwiftUI_WebView
//
//  Created by 홍승재 on 2022/08/02.
//

import SwiftUI

struct MyNaviagionLink: View {
    var body: some View {
        NavigationLink(destination: MyWebview(urlToLoad: "https://www.naver.com")
            .edgesIgnoringSafeArea(.all)) {
            Text("네이버")
                .fontWeight(.bold)
                .padding(20)
                .background(.green)
                .foregroundColor(.white)
                .cornerRadius(20)
                .font(.system(size: 20))
            }
    }
}
