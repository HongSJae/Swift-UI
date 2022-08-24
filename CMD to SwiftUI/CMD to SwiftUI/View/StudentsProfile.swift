//
//  StudentsProfile.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/12.
//

import SwiftUI
import PopupView

struct StudentsProfile: View {

    @Binding var shouldPopupMessage: Bool
    
    var proxy: GeometryProxy
    var name: String
        
    var body: some View {
        ZStack{
            Circle()
                .frame(width: proxy.size.width/4, height: proxy.size.width/4)
                .foregroundColor(.white)
            
            Image("Logo-B")
                .resizable()
                .frame(width: proxy.size.width/5, height: proxy.size.width/5)
                .opacity(0.3)
            
            Text(name)
                .font(.custom("NotoSansKR-Bold", size: 30))
                .foregroundColor(.black)
            Button(action: {
                self.shouldPopupMessage = true
            }){
                Circle()
                    .frame(width: proxy.size.width/4, height: proxy.size.width/4)
                    .opacity(0)
            }
        }
    }
}

//
//struct StudentsProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        StudentsProfile(proxy: GeometryProxy.frame(GeometryProxy))
//    }
//}
