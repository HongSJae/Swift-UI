//
//  pwTextField.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/09.
//

import SwiftUI

struct pwTextField: View {
    
    @State var pw: String
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                if pw.isEmpty {
                    Text("비밀번호")
                        .foregroundColor(.gray.opacity(0.4))
                        .font(.custom("NotoSansKR-Regular", size: 18))
                }
                SecureField("", text: $pw)
                    .font(.custom("NotoSansKR-Regular", size: 18))
                    .foregroundColor(.white)
            }
                .padding(.horizontal, 50).padding(.top, 20)
            Rectangle()
                .frame(height: 1.0, alignment: .bottom)
                .foregroundColor(.gray)
                .padding(.horizontal, 40)
        }
    }
}

