//
//  GetClassinfo.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/13.
//

import Foundation
import Alamofire

func ClassAPI(Number: Int) {
    let url = "http://54.180.122.62:8080/user/info/" + String(Number)
    AF.request(url,
               method: .get,
               encoding: URLEncoding.queryString,
               headers: ["Authorization": (Token ?? "")]
    )
    .validate(statusCode: 200..<300)
    .response { result in
        do{
            let model = try JSONDecoder().decode(Classinfo.self, from: result.data!)
            print("success")
        } catch {
            print(error)
            print("정보가 없어요")
        }
    }
}
