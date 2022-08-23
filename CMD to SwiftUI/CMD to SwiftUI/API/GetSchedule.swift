//
//  API.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/11.
//

import Foundation
import Alamofire

func WeekDaydate() -> String{
    let custom = DateFormatter()
    custom.dateFormat = "E"
    let nowdate: String = custom.string(from: .now)
    switch nowdate {
    case "월": return "mon"
    case "화": return "tue"
    case "수": return "wed"
    case "목": return "thu"
    case "금": return "fri"
    default:
        return nowdate
    }
}

func getTimeSchedule() {
    let url = "http://54.180.122.62:8080/user/timetable/" + WeekDaydate()
    AF.request(url,
               method: .get,
               encoding: URLEncoding.queryString,
               headers: ["Authorization": (Token ?? "")]
    )
    .validate(statusCode: 200..<300)
    .response { result in
        do{
            let model = try JSONDecoder().decode(TimeGet.self, from: result.data!)
            print("success")
            schedule.class1 = model.period1st!
            schedule.class2 = model.period2nd
            schedule.class3 = model.period3th
            schedule.class4 = model.period4th
            schedule.class5 = model.period5th
            schedule.class6 = model.period6th
            schedule.class7 = model.period7th
            schedule.class8 = model.period8th
            schedule.class9 = model.period9th
            schedule.class10 = model.period10th
            print("schedule changed! : \(schedule)")
        } catch {
            print(error)
            print("에런데용 :( ?")
        }
    }
}

struct Schedule {
    var class1: String
    var class2: String
    var class3: String
    var class4: String
    var class5: String
    var class6: String
    var class7: String
    var class8: String
    var class9: String
    var class10: String
}

var schedule = Schedule(class1: "1", class2: "2", class3: "3", class4: "4", class5: "5", class6: "6", class7: "7", class8: "8", class9: "9", class10: "10")

class GetSchedule: ObservableObject {
    
    @Published var schedule = [TimeGet]()
    
    init() {
        
    }
    
//    func fetchSchedule() {
//        let url = "http://54.180.122.62:8080/user/timetable/" + WeekDaydate()
//        print("WeekDayDate: \(WeekDaydate())")
//        AF.request(url, method: .get)
//            .responseDecodable(of: [TimeGet].self) { data in
//                guard let data = data.value else { return }
//                self.schedule = data
//            }
//    }
    
//    func postPost() {
//        let url = "https://jsonplaceholder.typicode.com/posts"
//
//        let param: [String: Any] = [
//            "userId" : 1000,
//            "id" : 1000,
//            "title" : "title",
//            "body" : "body"
//        ]
//
//        AF.request(url, method: .post, parameters: param, encoding: JSONEncoding.default)
//            .responseDecodable(of: Post.self) { response in
//                print("POST DEBUG : \(response)")
//            }
//    }
}
