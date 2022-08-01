//
//  ContentView.swift
//  SwiftUI_Image
//
//  Created by 홍승재 on 2022/08/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                CircleImageVIew()
                    .padding(.top, -200)
                    .padding(.bottom, 100)
                HStack {
                    NavigationLink(destination: MyWebview(urlToLoad: "https://www.apple.com/kr/mac/")) {
                        Text("맥북 구경하러가기")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(.purple)
                            .cornerRadius(20)
                    }
                    NavigationLink(destination: MyWebview(urlToLoad: "https://github.com/HongSJae")) {
                        Text("Reswo._. Github")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(.black)
                            .cornerRadius(20)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
