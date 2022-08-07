//
//  ContentView.swift
//  SwiftUI_Picker
//
//  Created by 홍승재 on 2022/08/07.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            HStack {
                NavigationLink(destination: MyPicker()) {
                    Text("Picker")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(.red)
                        .cornerRadius(20)
                }
                NavigationLink(destination: MyFilteredList()) {
                    Text("List")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(.orange)
                        .cornerRadius(20)
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
