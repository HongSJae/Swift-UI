//
//  SignupView.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/09.
//

import SwiftUI
import Alamofire

struct SignupView: View {
    @State var id: String = ""
    @State var pw: String = ""
    @State var pwc: String = ""
    @State var code: String = ""
    
    @State var openEye1 = false
    @State var openEye2 = false
//    @State var isNavigationBarHidden: Bool = true
    
    @State var showingAlertSpace: Bool = false
    @State var showingAlertError: Bool = false
    @State var showingAlertSame: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    func SignUp() {
        
        let url = BaseURL + "/signup/" + code
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        
        // POST 로 보낼 정보
        let params = ["userId": id, "password": pw] as Dictionary
        print("\(id), \(pw) 를 POST")
        // httpBody 에 parameters 추가
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("http Body Error")
        }
        
        AF.request(request).responseString { result in
            do{
                _ = try JSONDecoder().decode(SignUpInfo.self, from: result.data!)
                print("회원가입 성공")
                self.presentationMode.wrappedValue.dismiss()
            } catch {
                print(error)
                showingAlertError = true
            }
        }
        
    }
    
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
                            showingAlertSpace = true
                        } else {
                            if pw != pwc {
                                showingAlertSame = true
                            } else {
                                print("SignUp!!")
                                SignUp()
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
                            .alert("공백이 있습니다.", isPresented: $showingAlertSpace) {
                                Button("확인") {}
                            } message: {
                                Text("공백이 있는지 확인해주세요.")
                            }
                            .alert("회원가입 실패.", isPresented: $showingAlertError) {
                                Button("확인") {}
                            } message: {
                                Text("가입코드를 확인해주세요..")
                            }
                            .alert("비밀번호가 일치하지 않습니다.", isPresented: $showingAlertSame) {
                                Button("확인") {}
                            } message: {
                                Text("비밀번호와 비밀번호 확인이 일치하는지\n다시 한 번 확인해주세요,")
                            }
                            
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
