//
//  PostNotice.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/26.
//

import SwiftUI
import Alamofire

struct Post_Notice: View {
    
    @State var Title = ""
    @State var Content = ""
    
    @Binding var shouldPopupMessage: Bool
    
    @State var showingAlertError: Bool = false
    
    func PostNotice() {
        
        let url = BaseURL + "/user/post"
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        
        // POST 로 보낼 정보
        let params = ["title":Title, "contents":Content] as Dictionary
        
        // httpBody 에 parameters 추가
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
            request.headers = ["Authorization": Token!]
        } catch {
            print("http Body Error")
        }
        
        AF.request(request)
        .validate(statusCode: 200..<300)
        .responseData { response in
            print("Notice Post 성공!")
            shouldPopupMessage = false
        }
    }
    
    var body: some View {
        GeometryReader { GeometryProxy in
            ZStack(alignment: .top) {
                Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1)
                VStack {
                    HStack {
                        Text("글쓰기")
                            .foregroundColor(.white)
                            .font(.custom("NotoSansKR-Bold", size: 60))
                            .padding(.top, GeometryProxy.size.width/7)
                            .padding(.bottom, GeometryProxy.size.width/10 - 10)
                            .padding(.leading, 30)
                        Spacer()
                    }
                    TextField("제목", text: $Title)
                        .font(.custom("NotoSansKR-Bold", size: 25))
                        .foregroundColor(.black)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding(.horizontal, 20)
                        .frame(width: GeometryProxy.size.width - 40, height: GeometryProxy.size.width/6)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                    TextEditor(text: $Content)
                        .font(.custom("NotoSansKR-Regular", size: 25))
                        .foregroundColor(.black)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding(.horizontal, 20)
                        .frame(width: GeometryProxy.size.width - 40, height: GeometryProxy.size.height / 2)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                    Button {
                        if Title.isEmpty == true || Content.isEmpty {
                            showingAlertError = true
                        } else {
                            PostNotice()
                        }
                    } label: {
                        Text("작성")
                            .font(.custom("NotoSansKR-Bold", size: 25))
                            .frame(width: GeometryProxy.size.width - 40,
                                   height: GeometryProxy.size.width / 6)
                            .foregroundColor(.black)
                            .background(.white)
                            .cornerRadius(10)
                            .alert("공백이 있습니다", isPresented: $showingAlertError) {
                                Button("확인") {}
                            } message: {
                                Text("공백을 채우고 다시 해주세요.")
                            }
                    }

                }
            }
        }
    }
}
//
//struct PostNotice_Previews: PreviewProvider {
//    static var previews: some View {
//        Post_Notice(shouldPopupMessage: <#Binding<Bool>#>)
//    }
//}
