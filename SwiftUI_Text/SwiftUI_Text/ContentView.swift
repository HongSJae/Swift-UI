//
//  ContentView.swift
//  SwiftUI_Text
//
//  Created by 홍승재 on 2022/08/02.
//

import SwiftUI

struct ContentView: View {
    
    static let dateFormet: DateFormatter = {
        let formetter = DateFormatter()
        formetter.dateFormat = "YYYY년 M월 d일 E요일"
//        formetter.dateStyle = .long
        return formetter
    }()
    
    var today = Date()
    
    var TrueOrFalse: Bool = false
    
    var Number: Int = 123
    
    var body: some View {
        
        VStack {
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s")
                .tracking(2)
            
                .font(.system(.body, design: .rounded))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .lineSpacing(10)
                .truncationMode(.middle)
                .shadow(color: .red, radius: 1.5, x: 10 , y: 10)
            
                .padding(50)
                .background(.yellow)
                .cornerRadius(10)
            
                .padding(20)
                .background(.green)
                .cornerRadius(20)
            
                .padding()
            
            Text("안녕하세요!!")
                .background(.gray)
                .foregroundColor(.white)
                .padding(0)
            
            Text("오늘의 날짜 : \(today, formatter: ContentView.dateFormet) ")
            
            Text("참 혹은 거짓 : \(String(TrueOrFalse))")
            Text("숫자 : \(Number)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
