//
//  SigninView.swift
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

struct SigninView: View {
    
    @State var id: String = ""
    @State var pw: String = ""
    
    
    var body: some View {
        GeometryReader { GeometryProxy in
            ZStack {
                ColorManager.BackgroundColor.ignoresSafeArea()
                VStack {
                    Spacer()
                        .frame(height: 74)
                    HStack {
                        Spacer()
                            .frame(width: 50)
                        Text("로그인")
                            .foregroundColor(.white)
                            .font(.custom("NotoSansKR-Bold", size: 50))
                        Spacer()
                    }
                    Spacer()
                        .frame(height:  70)
                    VStack {
                        ZStack(alignment: .leading) {
                            if id.isEmpty {
                                Text("아이디")
                                    .foregroundColor(.gray.opacity(0.4))
                                    .font(.custom("NotoSansKR-Regular", size: 18))
                            }
                            TextField("", text: $id)
                                .font(.custom("NotoSansKR-Regular", size: 18))
                                .foregroundColor(.white)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        }
                        .padding(.horizontal, 50).padding(.top, 20)
                        Rectangle()
                            .frame(height: 1.0, alignment: .bottom)
                            .foregroundColor(.white)
                            .padding(.horizontal, 40)
                    }
                    Spacer()
                        .frame(height: 46)
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
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        }
                        .padding(.horizontal, 50).padding(.top, 20)
                        Rectangle()
                            .frame(height: 1.0, alignment: .bottom)
                            .foregroundColor(.white)
                            .padding(.horizontal, 40)
                    }
                    Spacer()
                    Button {
                        print("Login!!")
                    } label: {
                        Text("로그인")
                            .font(.custom("NotoSansKR-Medium", size: 18))
                            .frame(width: GeometryProxy.size.width - 80,
                                   height: GeometryProxy.size.height / 15)
                            .foregroundColor(.black)
                            .background(.white)
                            .cornerRadius(10)
                    }
                    HStack {
                        Button {
                            print("go to Signup")
                        } label: {
                            Text("아이디가 없으신가요?")
                                .font(.custom("NotoSansKR-Regular", size: 12))
                                .foregroundColor(.white)
                        }
                        Button {
                            print("go to Signup")
                        } label: {
                            Text("회원가입")
                                .font(.custom("NotoSansKR-Bold", size: 12))
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                        .frame(height: 80)
                }
            }
        }
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
