//
//  RandomUserViewModel.swift
//  SwiftUI_RandomUserApi
//
//  Created by 홍승재 on 2022/08/08.
//

import Foundation
import Combine
import Alamofire

class RandomUserViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    
    @Published var RandomUsers = [RandomUser]()
    
    var baseUrl = "https://randomuser.me/api/?results=10"
    
    init() {
        print(#fileID, #function, #line, "" )
    }
    
    func fetchRandomUser() {
        print(#fileID, #function, #line, "" )
        AF.request(baseUrl)
            .publishDecodable(type: RandomUserResponse.self)
            .compactMap{ $0.value }
            .map{ $0.results }
            .sink { completion in
                print("데이터 스트림 완료")
            } receiveValue: { receivedValue in
                print("받은 값 : \(receivedValue.count)")
                self.RandomUsers = receivedValue
            }
            .store(in: &subscription)

    }
}
