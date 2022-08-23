//
//  StudentsProfile.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/12.
//

import SwiftUI

struct StudentsProfile: View {
    
    @State private var showModal = false //상태
    
    var proxy: GeometryProxy
    var name: String
    
    var body: some View {
        ZStack{
            Button(action: {
                self.showModal = true
            }){
                Circle()
                    .frame(width: proxy.size.width/3.5, height: proxy.size.width/3.5)
                    .foregroundColor(.white)
            }
            .sheet(isPresented: self.$showModal) {
                Detail_Info()
            }
            
            Image("Logo-B")
                .resizable()
                .frame(width: proxy.size.width/4.5, height: proxy.size.width/5)
                .opacity(0.3)
            
            Text(name)
                .font(.custom("NotoSansKR-Bold", size: 30))
                .foregroundColor(.black)
        }
    }
}
//
//struct StudentsProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        StudentsProfile(proxy: GeometryProxy.frame(GeometryProxy))
//    }
//}
