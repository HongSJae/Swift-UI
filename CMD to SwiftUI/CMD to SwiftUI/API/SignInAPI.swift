//
//  SignInAPI.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/11.
//

import Foundation
import Alamofire

func Login(id: String, pw: String) {
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
        } catch {
            print(result)
            print(error)
//            AlertFunc(title: "아이디나 비밀번호 확인바람", message: "아이디나 비밀번호가 잘못되었습니다")
        }
    }
    
}
