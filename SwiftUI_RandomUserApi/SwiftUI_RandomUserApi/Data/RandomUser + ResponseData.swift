//
//  RandomUser + ResponseData.swift
//  SwiftUI_RandomUserApi
//
//  Created by 홍승재 on 2022/08/08.
//

import Foundation
import CloudKit

struct RandomUser: Codable, Identifiable, CustomStringConvertible {
    var id = UUID()
    var name: Name
    var photo: Photo
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case photo = "picture"
    }
    
    static func  getDummy() -> Self {
        print(#fileID, #function, #line)
        return RandomUser(name: Name.getDummy(), photo: Photo.getDummy())
    }
    
    var ProFileImageURL: URL {
        get {
            URL(string: photo.medium)!
        }
    }
    
    var description: String {
        return name.description
    }
}

struct Name: Codable {
    var title, first, last: String
    
    var description: String {
        return "[\(title)] \(last), \(first)"
    }
    
    static func  getDummy() -> Self {
        print(#fileID, #function, #line)
        return Name(title: "유튜버", first: "정대리", last: "개발하는")
    }
    
}

struct Photo: Codable {
    let large, medium, thumbnail: String
    
    static func  getDummy() -> Self {
        print(#fileID, #function, #line)
        return Photo(large: "https://randomuser.me/api/portraits/men/96.jpg",
                     medium: "https://randomuser.me/api/portraits/men/96.jpg",
                     thumbnail: "https://randomuser.me/api/portraits/men/96.jpg")
    }
}

struct Info: Codable {
    let seed: String
    let resultsCount, page: Int
    let version: String
    
    private enum CodingKeys: String, CodingKey {
        case seed = "seed"
        case resultsCount = "results"
        case page = "page"
        case version = "version"
    }
}

struct RandomUserResponse: Codable, CustomStringConvertible {
    var results: [RandomUser]
    var info: Info

    private enum CodingKeys: String, CodingKey {
        case results, info
    }
    
    var description: String {
        return "results.count: \(results.count) / info: \(info.seed)"
    }
}
