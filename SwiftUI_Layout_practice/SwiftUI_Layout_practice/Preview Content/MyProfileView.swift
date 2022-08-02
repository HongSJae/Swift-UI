//
//  MyProfileView.swift
//  SwiftUI_Layout_practice
//
//  Created by 홍승재 on 2022/08/03.
//

import SwiftUI

struct MyProfileView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                MyCircleImage(imageString: "MyGitProfile")
                    .padding(.vertical, 20)
                
                Text("Reswo._.")
                    .font(.system(size: 30))
                    .fontWeight(.black)
                Spacer()
                    .frame(height: 20)
                Text("iOS 개발을 배우고 있습니다!")
                    .font(.system(size: 25))
                    .fontWeight(.black)
                HStack {
                    NavigationLink(destination: Text("url")) {
                        Text("GitHub")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                        
                            .padding()
                            .background(.red)
                            .cornerRadius(20)
                    }
                    NavigationLink(destination: Text("url")) {
                        Text("Instargram")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                        
                            .padding() 
                            .background(.orange)
                            .cornerRadius(20)
                    }

                }
                .padding()
                Spacer()
            }
        } //scrollview
        .navigationBarTitle("내 프로필")
        .navigationBarItems(trailing: NavigationLink(destination: Text("다음 화면입니다")){
            Image(systemName: "gear")
                .foregroundColor(.black)
        })
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}
