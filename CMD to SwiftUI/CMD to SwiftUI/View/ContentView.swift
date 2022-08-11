//
//  ContentView.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/09.
//

import SwiftUI

struct ColorManager {
    // create static variables for custom colors
    static let BackgroundColor = Color("bgColor")
    
    //... add the rest of your colors here
}

struct ContentView: View {
 
    var body: some View {
        NavigationView {
            GeometryReader { GeometryProxy in
                ZStack(alignment: .bottom) {
                    ColorManager.BackgroundColor.ignoresSafeArea()
                    VStack {
                        Image("Logo")
                            .resizable()
                            .frame(width: 177, height: 166)
                            .padding(.top, 190)
                        Spacer()
                        NavigationLink(destination: SigninView()) {
                            Text("여기를 눌러서 시작하세요")
                                .foregroundColor(.white)
                                .font(.custom("NotoSansKR-Medium", size: 23))
                        }
                        .padding(.bottom, 50)
                        .navigationBarHidden(true)
                        .onAppear (perform : UIApplication.shared.hideKeyboard)
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
}
