//
//  MyProjectCard.swift
//  SwiftUI_Layout_practice
//
//  Created by 홍승재 on 2022/08/02.
//

import SwiftUI

struct MyProjectCard: View {
    
    @State
    var shouldShowAlert = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Rectangle()
                .frame(height: 0)
            Text("유튜브 보기")
                .font(.system(size: 23))
                .fontWeight(.black)
                .padding(.bottom, 5)
            Text("12 PM - 3 PM")
                .foregroundColor(.secondary)
            Spacer()
                .frame(height: 20)
            HStack {
                Image("user1")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 2)
                            .foregroundColor(.blue)
                    )
                Image("user2")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Image("user3")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Spacer()
                Button(action: {
                    print("버튼이 클릭되었다.")
                    self.shouldShowAlert = true
                }) {
                    Text("확인")
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .frame(width: 80)
                        .background(.blue)
                        .cornerRadius(20)
                }
                .alert(isPresented: $shouldShowAlert) {
                    Alert(title: Text("알림창입니다!"))
                }
            }
        }
        .padding(30)
        .background(.yellow)
        .cornerRadius(20)
    }
}

struct MyProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        MyProjectCard()
    }
}
