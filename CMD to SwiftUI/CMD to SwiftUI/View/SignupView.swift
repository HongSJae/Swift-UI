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
//    @State var isNavigationBarHidden: Bool = true
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { GeometryProxy in
            ZStack(alignment: .bottom) {
                ColorManager.BackgroundColor.ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                            .frame(width: 50)
                        Text("회원가입")
                            .foregroundColor(.white)
                            .font(.custom("NotoSansKR-Bold", size: 50))
                            .padding(.top ,74)
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
                            SecureField("", text: $pw)
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
                    VStack {
                        ZStack(alignment: .leading) {
                            if pw.isEmpty {
                                Text("비밀번호 확인")
                                    .foregroundColor(.gray.opacity(0.4))
                                    .font(.custom("NotoSansKR-Regular", size: 18))
                            }
                            SecureField("", text: $pwc)
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
                    VStack {
                        ZStack(alignment: .leading) {
                            if pw.isEmpty {
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
                            AlertFunc(title: "공백이 있습니다", message: "모든 칸을 입력해주세요")
                        } else {
                            if pw != pwc {
                                AlertFunc(title: "비밀번호가 다릅니다", message: "비밀번호와 비밀번호 확인에 \n적힌 값이 다릅니다! 확인해주세요!")
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
                    HStack {
                        Button(action:{ self.presentationMode.wrappedValue.dismiss() }){
                            Text("아이디가 있으신가요?")
                                .font(.custom("NotoSansKR-Regular", size: 12))
                                .foregroundColor(.white)
                        }
                        Button(action:{ self.presentationMode.wrappedValue.dismiss() }){
                            Text("로그인")
                                .font(.custom("NotoSansKR-Bold", size: 12))
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                        .frame(height: 40)
                }
//                .navigationBarHidden(self.isNavigationBarHidden)
//                .onAppear  {
//                    self.isNavigationBarHidden = true
//                }
                .navigationBarHidden(true)
                .onAppear (perform : UIApplication.shared.hideKeyboard)
                }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
