//
//  ContentView.swift
//  SwiftUI_WebView
//
//  Created by 홍승재 on 2022/08/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            HStack {
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
                
                NavigationLink(destination: MyWebview(urlToLoad: "https://www.youtube.com")
                    .edgesIgnoringSafeArea(.bottom)) {
                    Text("유튜브")
                        .fontWeight(.bold)
                        .padding(20)
                        .background(.red)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .font(.system(size: 20))
                }

                NavigationLink(destination: MyWebview(urlToLoad: "https://www.google.com")
                    .edgesIgnoringSafeArea(.all)) {
                    Text("구글")
                        .fontWeight(.bold)
                        .padding(20)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .font(.system(size: 20))
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
