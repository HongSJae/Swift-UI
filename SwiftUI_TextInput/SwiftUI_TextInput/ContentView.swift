//
//  ContentView.swift
//  SwiftUI_TextInput
//
//  Created by 홍승재 on 2022/08/05.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                TextField("사용자 이름", text: $username)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
                Button {
                    self.username = ""
                } label: {
                    if self.username.count > 0 {
                        Image(systemName: "multiply.circle.fill")
                            .font(.system(size: 25))
                            .foregroundColor(.secondary)
                    }
                }

            }
            HStack {
                SecureField("암호", text: $password)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
                Button {
                    self.password = ""
                } label: {
                    if self.password.count > 0 {
                        Image(systemName: "multiply.circle.fill")
                            .font(.system(size: 25))
                            .foregroundColor(.secondary)
                    }
                }
            }
            Text("입력한 암호 : \(password)")
        }
        .padding(.horizontal, 50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
