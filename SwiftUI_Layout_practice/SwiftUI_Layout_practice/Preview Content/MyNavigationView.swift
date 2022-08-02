//
//  MyNavigationView.swift
//  SwiftUI_Layout_practice
//
//  Created by 홍승재 on 2022/08/02.
//

import SwiftUI

struct MyNavigationView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("MyGitProfile")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 250, height: 250)
                    .shadow(radius: 20)
                    .overlay(Circle()
                        .stroke(
                            .yellow,
                            lineWidth: 20)
                        .shadow(radius: 10, x: 0, y: 10))
                    .padding(30)
                Text("Reswo._.")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                    .padding()
                Text("iOS 개발을 배우고 있습니다!")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                HStack {
                    NavigationLink(destination: Text("url")) {
                        Text("GitHub")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                        
                            .frame(width: 150, height: 60)
                            .background(.red)
                            .cornerRadius(20)
                    }
                    NavigationLink(destination: Text("url")) {
                        Text("Instargram")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                        
                            .frame(width: 150, height: 60)
                            .background(.orange)
                            .cornerRadius(20)
                    }

                }
                Spacer()
            }
                .navigationBarTitle("내 프로필")
                .navigationBarItems(trailing: NavigationLink(destination: Text("다음 화면입니다")){
                    Image(systemName: "car.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                })
        }
    }
}

struct MyNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView()
    }
}
