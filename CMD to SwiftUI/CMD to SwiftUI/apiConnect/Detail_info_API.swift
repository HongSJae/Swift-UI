//
//  File.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/24.
//

import Foundation
import Alamofire

//MARK: - 학생정보 불러오기 함수

func ClassAPI() {
    print(ThisNumber)
    let url = "http://54.180.122.62:8080/user/info/" + ThisNumber
    AF.request(url,
               method: .get,
               encoding: URLEncoding.queryString,
               headers: ["Authorization": Token!]
    )
    .validate(statusCode: 200..<300)
    .response { result in
        do{
            let model = try JSONDecoder().decode(Classinfo.self, from: result.data!)
            UName = model.username ?? "이름"
            UNumber = model.username ?? "정보없음"
            UBirth = model.birthday ?? "정보없음"
            UField = model.field ?? "정보없음"
            
            print("success")
            
        } catch {
            print(error)
            print("정보가 없어요")
        }
    }
}
