//
//  MyWebView.swift
//  SwiftUI_Image
//
//  Created by 홍승재 on 2022/08/02.
// 

import SwiftUI
import WebKit

//UIKit의 UIView를 사용할 수 있도록 한다.
struct MyWebview: UIViewRepresentable {
    
    var urlToLoad: String
    
    //UIview 만들기
    func makeUIView(context: Context) -> WKWebView {
        
        //Unwrapping
        guard let url = URL(string: self.urlToLoad) else { return WKWebView() }
        
        //웹뷰 인스턴스 생성
        let WebView = WKWebView()
        
        //웹뷰 로드
        WebView.load(URLRequest(url: url))
        
        return WebView
        
    }
    
    //Update UIView
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebview>) {
        
    }
}

struct MyWebView: PreviewProvider {
    static var previews: some View {
        MyWebview(urlToLoad: "https://www.youtube.com")
    }
}
