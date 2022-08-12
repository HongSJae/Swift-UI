//
//  SignupAPI.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/11.
//

import Foundation
import Alamofire

func SignUp(id: String, pw: String, code: String) {
    
    let url = "http://54.180.122.62:8080/signup/" + code
    
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
        } catch {
            print(error)
//            AlertFunc(title: "가입코드가 다른데요?😅", message: "다시 확인 후 적어주세요!")
        }
    }
    
}
