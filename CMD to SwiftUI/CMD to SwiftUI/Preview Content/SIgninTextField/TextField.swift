//
//  TextField.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/09.
//

import SwiftUI

struct TextField: View {
    
    var text: String
    
//    var body: some View {
//        ZStack(alignment: .leading) {
//            if id.isEmpty {
//                Text(text)
//                    .foregroundColor(.gray.opacity(0.4))
//                    .font(.custom("NotoSansKR-Regular", size: 18))
//            }
//            TextField("", text: $pw)
//                .font(.custom("NotoSansKR-Regular", size: 18))
//        }
//            .padding(.horizontal, 50).padding(.top, 20)
//        Rectangle()
//            .frame(height: 1.0, alignment: .bottom)
//            .foregroundColor(.gray)
//            .padding(.horizontal, 40)
//    }
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        TextField(text: "로그인")
    }
}
