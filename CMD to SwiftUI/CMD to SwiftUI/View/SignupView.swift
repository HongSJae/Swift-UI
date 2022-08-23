//
//  SignupView.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/09.
//

import SwiftUI

struct SignupView: View {
    @State var id: String = ""
    @State var pw: String = ""
    @State var pwc: String = ""
    @State var code: String = ""
    
    @State var openEye1 = false
    @State var openEye2 = false
//    @State var isNavigationBarHidden: Bool = true
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { GeometryProxy in
            ZStack {
                ColorManager.BackgroundColor.ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                            .frame(width: 50)
                        Text("회원가입")
                            .foregroundColor(.white)
                            .font(.custom("NotoSansKR-Bold", size: 50))
                            .padding(.top, GeometryProxy.size.width/6 - 10)
                            .padding(.bottom, GeometryProxy.size.width/9 - 20)
                        Spacer()
                    }
//                    Spacer()
//                        .frame(height:  70)
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
                    VStack {
                        ZStack(alignment: .leading) {
                            if pw.isEmpty {
                                Text("비밀번호")
                                    .foregroundColor(.gray.opacity(0.4))
                                    .font(.custom("NotoSansKR-Regular", size: 18))
                            }
                            if !openEye1 {
                                SecureField("", text: $pw)
                                    .font(.custom("NotoSansKR-Regular", size: 18))
                                    .foregroundColor(.white)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                            } else {
                                TextField("", text: $pw)
                                    .font(.custom("NotoSansKR-Regular", size: 18))
                                    .foregroundColor(.white)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                            }
                            if !pw.isEmpty {
                                HStack {
                                    Spacer()
                                    Button {
                                        self.openEye1.toggle()
                                        print(openEye1)
                                    } label: {
                                        Image(systemName: openEye1 ? "eye" : "eye.slash")
                                            .foregroundColor(.white)
                                            .font(.custom("NotoSansKR-Regular", size: 18))
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 50).padding(.top, 30)
                        Rectangle()
                            .frame(height: 1.0, alignment: .bottom)
                            .foregroundColor(.white)
                            .padding(.horizontal, 40)
                    }
                    VStack {
                        ZStack(alignment: .leading) {
                            if pwc.isEmpty {
                                Text("비밀번호 확인")
                                    .foregroundColor(.gray.opacity(0.4))
                                    .font(.custom("NotoSansKR-Regular", size: 18))
                            }
                            if !openEye2 {
                                SecureField("", text: $pwc)
                                    .font(.custom("NotoSansKR-Regular", size: 18))
                                    .foregroundColor(.white)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                            } else {
                                TextField("", text: $pwc)
                                    .font(.custom("NotoSansKR-Regular", size: 18))
                                    .foregroundColor(.white)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                            }
                            if !pwc.isEmpty {
                                HStack {
                                    Spacer()
                                    Button {
                                        self.openEye2.toggle()
                                        print(openEye2)
                                    } label: {
                                        Image(systemName: openEye2 ? "eye" : "eye.slash")
                                            .foregroundColor(.white)
                                            .font(.custom("NotoSansKR-Regular", size: 18))
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 50).padding(.top, 30)
                        Rectangle()
                            .frame(height: 1.0, alignment: .bottom)
                            .foregroundColor(.white)
                            .padding(.horizontal, 40)
                    }
                    VStack {
                        ZStack(alignment: .leading) {
                            if code.isEmpty {
                                Text("가입코드")
                                    .foregroundColor(.gray.opacity(0.4))
                                    .font(.custom("NotoSansKR-Regular", size: 18))
                            }
                            TextField("", text: $code)
                                .font(.custom("NotoSansKR-Regular", size: 18))
                                .foregroundColor(.white)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        }
                        .padding(.horizontal, 50).padding(.top, 30)
                        Rectangle()
                            .frame(height: 1.0, alignment: .bottom)
                            .foregroundColor(.white)
                            .padding(.horizontal, 40)
                    }
                    Spacer()
                    Button {
                        if id.isEmpty == true || pw.isEmpty == true || pwc.isEmpty == true || code.isEmpty == true {
                        } else {
                            if pw != pwc {
                            } else {
                                print("SignUp!!")
                                SignUp(id: id, pw: pw, code: code)
                            }
                        }
                    } label: {
                        Text("회원가입")
                            .font(.custom("NotoSansKR-Medium", size: 18))
                            .frame(width: GeometryProxy.size.width - 80,
                                   height: GeometryProxy.size.height / 15)
                            .foregroundColor(.black)
                            .background(.white)
                            .cornerRadius(10)
                    }
                    Button(action:{ self.presentationMode.wrappedValue.dismiss() }){
                        HStack {
                            Text("아이디가 있으신가요?")
                                .font(.custom("NotoSansKR-Regular", size: 12))
                                .foregroundColor(.white)
                            Text("로그인")
                                .font(.custom("NotoSansKR-Bold", size: 12))
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                        .frame(height: 40)
                }
                .navigationBarHidden(true)
                .onAppear (perform : UIApplication.shared.hideKeyboard)
                }
            .ignoresSafeArea(.keyboard)
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
