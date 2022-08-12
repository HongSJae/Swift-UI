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
        VStack{
            Button(action: {
                self.showModal = true
            }){
                Image("Profile")
                    .resizable()
                    .frame(width: proxy.size.width/4, height: proxy.size.width/4)
            }
            .sheet(isPresented: self.$showModal) {
                Detail_Info()
            }
            
            Text(name)
                .font(.custom("NotoSansKR-Regular", size: 15))
                .foregroundColor(.white)
                .padding(.top, 8)
        }
    }
}
//
//struct StudentsProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        StudentsProfile(proxy: GeometryProxy.frame(GeometryProxy))
//    }
//}
