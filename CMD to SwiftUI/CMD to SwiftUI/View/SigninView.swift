//
//  SigninView.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/09.
//

import SwiftUI

var Token: String? = "nil"

struct SigninView: View {
    
    @State var id: String = ""
    @State var pw: String = ""
    @State var tag:Int? = nil
//    @State var isNavigationBarHidden: Bool = true
    
    
    var body: some View {
        GeometryReader { GeometryProxy in
            ZStack {
                ColorManager.BackgroundColor.ignoresSafeArea()
                NavigationLink(destination: TabBarView(), tag: 1, selection: self.$tag ) {
                          EmptyView()
                        }
                VStack {
                    HStack {
                        Spacer()
                            .frame(width: 50)
                        Text("로그인")
                            .foregroundColor(.white)
                            .font(.custom("NotoSansKR-Bold", size: 50))
                            .padding(.top, 74)
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
                    Spacer()
                    Button {
                        if id == "" || pw == "" {
                            //ID나 PW가 공백일 때
//                            AlertFunc(title: "입력이 잘못됨", message: "아이디나 비밀번호가 공백이 있습니다\n확인해주세요")
                        } else {
                            //아니면 로그인
//                            Login(id: id, pw: pw)
//                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
//                              // 1초 후 실행될 부분
//                                switch Token {
//                                case "nil", nil :
//                                    print("token is nil")
//                                    break
//                                default :
//                                    getTimeSchedule()
//                                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
//                                      // 1초 후 실행될 부분
//                                        self.tag = 1
//                                        print("Login!!")
//                                    }
//                                }
//                            }
                            Login(id: id, pw: pw)
                            
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                                switch Token {
                                case "nil", nil :
                                    print("token is nil")
                                    break
                                default :
                                    self.tag = 1
                                    print("Login!!")
                                }
                            }
                            
                        }
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
                        NavigationLink(destination: SignupView()) {
                            Text("아이디가 없으신가요?")
                                .font(.custom("NotoSansKR-Regular", size: 12))
                                .foregroundColor(.white)
                        }
                        NavigationLink(destination: SignupView()){
                            Text("회원가입")
                                .font(.custom("NotoSansKR-Bold", size: 12))
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                        .frame(height: 40)
                }
            }
                .navigationBarHidden(true) 
                .onAppear (perform : UIApplication.shared.hideKeyboard)
        }
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
