//
//  idTextField.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/09.
//

import SwiftUI

struct idTextField: View {
    
    @State var id: String
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                if id.isEmpty {
                    Text("로그인")
                        .foregroundColor(.gray.opacity(0.4))
                        .font(.custom("NotoSansKR-Regular", size: 18))
                }
                TextField("", text: $id)
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

