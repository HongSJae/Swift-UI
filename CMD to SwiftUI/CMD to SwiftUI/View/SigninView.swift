//
//  SigninView.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/09.
//
import SwiftUI
import Alamofire

var Token: String? = "nil"

struct SigninView: View {
    
    @State var id: String = ""
    @State var pw: String = ""
    @State var tag:Int? = nil
    @State var openEye: Bool = false
    
    func Login() {
        let url = "http://54.180.122.62:8080/signin"
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        
        // POST 로 보낼 정보
        let params = ["userId":id, "password":pw] as Dictionary
        
        // httpBody 에 parameters 추가
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("http Body Error")
        }
        
        AF.request(request).responseString { result in
            do{
                let model = try JSONDecoder().decode(SignInInfo.self, from: result.data!)
                Token = model.accessToken
                print("보낼 토큰은 : \(Token ?? "error")")
                self.tag = 1
            } catch {
                print(result)
                print(error)
            }
        }
        
    }
    
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
                            .padding(.top, GeometryProxy.size.width/6)
                            .padding(.bottom, GeometryProxy.size.width/9 - 10)
                        Spacer()
                    }
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
                            } else {
                                
                            }
                            if !openEye {
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
                                        self.openEye.toggle()
                                        print(openEye)
                                    } label: {
                                        Image(systemName: openEye ? "eye" : "eye.slash")
                                            .foregroundColor(.white)
                                            .font(.custom("NotoSansKR-Regular", size: 18))
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 50)
                        .padding(.top, 30)
                        Rectangle()
                            .frame(height: 1.0, alignment: .bottom)
                            .foregroundColor(.white)
                            .padding(.horizontal, 40)
                    }
                    Spacer()
                    Button {
                        if id == "" || pw == "" {
                        } else {
                            Login()
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
                    NavigationLink(destination: SignupView()) {
                        HStack {
                            Text("아이디가 없으신가요?")
                                .font(.custom("NotoSansKR-Regular", size: 12))
                                .foregroundColor(.white)
                            
                                Text("회원가입")
                                    .font(.custom("NotoSansKR-Bold", size: 12))
                                    .foregroundColor(.white)
                        }
                    }
                    Spacer()
                        .frame(height: 40)
                }
                .ignoresSafeArea(.keyboard)
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
