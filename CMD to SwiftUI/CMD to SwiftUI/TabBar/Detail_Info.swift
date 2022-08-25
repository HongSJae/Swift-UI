//
//  Detail_Info.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/12.
//

import SwiftUI
import Alamofire

struct bginfo {
    // create static variables for custom colors
    static let BackgroundColor = Color("Classinfo")
    
    //... add the rest of your colors here
}

//MARK: - 학생정보 불러오기 함수

struct Detail_Info: View {
    
    @Binding var UserNumber: String
    
    var UserName: String
    var UserBirth: String
    var Userfield: String
    var UserSeat: CLong?
    
    @Binding var shouldPopupMessage: Bool
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .top) {
                bginfo.BackgroundColor.ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            shouldPopupMessage = false
                        }) {
                            Image(systemName: "xmark")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 16, height: 16)
                                .padding(20)
                        }
                    }
                    ZStack{
                        Circle()
                            .frame(width: proxy.size.width/3.5, height: proxy.size.width/3.5)
                            .foregroundColor(.white)
                        
                        Image("Logo-B")
                            .resizable()
                            .frame(width: proxy.size.width/4.5, height: proxy.size.width/5)
                            .opacity(0.3)
                        
                        Text(UserName)
                            .font(.custom("NotoSansKR-Bold", size: 30))
                            .foregroundColor(.black)
                    }
                    HStack {
                        Text("회원 정보")
                            .font(.custom("NotoSansKR-Bold", size: 20))
                            .foregroundColor(.white)
                            .padding(.top, 40)
                            .padding(.leading, 30)
                        Spacer()
                    }
                    HStack {
                        VStack(alignment: .leading) {
                            Text("이름")
                                .font(.custom("NotoSansKR-Regular", size: 13))
                                .foregroundColor(.white)
                                .padding(.bottom, 15)
                            Text("학번")
                                .font(.custom("NotoSansKR-Regular", size: 13))
                                .foregroundColor(.white)
                                .padding(.bottom, 15)
                            Text("생년월일")
                                .font(.custom("NotoSansKR-Regular", size: 13))
                                .foregroundColor(.white)
                                .padding(.bottom, 15)
                            Text("전공")
                                .font(.custom("NotoSansKR-Regular", size: 13))
                                .foregroundColor(.white)
                        }
                        .padding(.leading, 30)
                        .padding(.top, 21)
                        Spacer()
                            .frame(width: 20)
                        VStack(alignment: .leading) {
                            Text(UserName)
                                .font(.custom("NotoSansKR-Bold", size: 14))
                                .foregroundColor(.white)
                                .padding(.bottom, 15)
                            Text(UserNumber)
                                .font(.custom("NotoSansKR-Bold", size: 14))
                                .foregroundColor(.white)
                                .padding(.bottom, 15)
                            Text(UserBirth)
                                .font(.custom("NotoSansKR-Bold", size: 14))
                                .foregroundColor(.white)
                                .padding(.bottom, 15)
                            Text(Userfield)
                                .font(.custom("NotoSansKR-Bold", size: 14))
                                .foregroundColor(.white)
                        }
                        .padding(.leading, 30)
                        .padding(.top, 21)
                        Spacer()
                    }
                    HStack {
                        Text("자리 배치")
                            .font(.custom("NotoSansKR-Bold", size: 20))
                            .foregroundColor(.white)
                            .padding(.top, 40)
                            .padding(.leading, 30)
                        Spacer()
                    }
                    ZStack(alignment: .center) {
                        Rectangle()
                            .frame(width: proxy.size.width - 60, height: (proxy.size.width - 60) / 1.3)
                            .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.5))
                            .cornerRadius(10)
                        LazyVGrid(columns: columns) {
                            ForEach(0..<18, id: \.self) { i in
                                if i + 1 == UserSeat {
                                    Rectangle()
                                        .frame(width: proxy.size.width / 9, height: proxy.size.width / 14)
                                        .foregroundColor(Color(red: 0.692, green: 0.692, blue: 0.692, opacity: 1))
                                        .cornerRadius(2)
                                } else {
                                    Rectangle()
                                        .frame(width: proxy.size.width / 9, height: proxy.size.width / 14)
                                        .foregroundColor(Color(red: 0.692, green: 0.692, blue: 0.692, opacity: 0.1))
                                        .cornerRadius(2)
                                        .padding(.vertical, 5)
                                }
                            }
                        }
                        .padding(40)
                    }
                    Spacer()
                }
            }
            .onAppear {
//                DetailAPI(num: UserNumber)
            }
        }
    }
}

//struct Detail_Info_Previews: PreviewProvider {
//    static var previews: some View {
//        Detail_Info(UserNumber: "1218")
//    }
//}
