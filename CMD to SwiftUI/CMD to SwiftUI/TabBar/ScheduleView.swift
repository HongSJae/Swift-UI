//
//  ScheduleView.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/09.
//

import SwiftUI
import Alamofire

struct ScheduleView: View {
    
    @State var Class1: String = ""
    @State var Class2: String = ""
    @State var Class3: String = ""
    @State var Class4: String = ""
    @State var Class5: String = ""
    @State var Class6: String = ""
    @State var Class7: String = ""
    @State var Class8: String = ""
    @State var Class9: String = ""
    @State var Class10: String = ""
    
    @State var date: String = ""
    @State var PlusDate: Int = 0
    @State var MinusDate: Int = 0
    
    func getYesterDayDateTime24() {
        MinusDate += 1
        PlusDate -= 1
        // [date 객체 사용해 현재 날짜 및 시간 24시간 형태 출력 실시]
        let nowDate = Date() // 현재의 Date 날짜 및 시간
        let YesterDayDate = Calendar.current.date(byAdding: .day, value: -MinusDate, to: nowDate)
        let dateFormatter = DateFormatter() // Date 포맷 객체 선언
        dateFormatter.locale = Locale(identifier: "ko") // 한국 지정
        
        dateFormatter.dateFormat = "yyyy년 M월 d일 E요일" // Date 포맷 타입 지정
        let date_string = dateFormatter.string(from: YesterDayDate!) // 포맷된 형식 문자열로 반환
        
        date = date_string
    }

    func getNowDateTime24() {
        // [date 객체 사용해 현재 날짜 및 시간 24시간 형태 출력 실시]
        let nowDate = Date() // 현재의 Date 날짜 및 시간
        let dateFormatter = DateFormatter() // Date 포맷 객체 선언
        dateFormatter.locale = Locale(identifier: "ko") // 한국 지정
        
        dateFormatter.dateFormat = "yyyy년 M월 d일 E요일" // Date 포맷 타입 지정
        let date_string = dateFormatter.string(from: nowDate) // 포맷된 형식 문자열로 반환
        
        date = date_string
    }

    func getTommorowDateTime24() {
        PlusDate += 1
        MinusDate -= 1
        // [date 객체 사용해 현재 날짜 및 시간 24시간 형태 출력 실시]
        let nowDate = Date() // 현재의 Date 날짜 및 시간
        let TommorowDayDate = Calendar.current.date(byAdding: .day, value: PlusDate, to: nowDate)
        let dateFormatter = DateFormatter() // Date 포맷 객체 선언
        dateFormatter.locale = Locale(identifier: "ko") // 한국 지정
        
        dateFormatter.dateFormat = "yyyy년 M월 d일 E요일" // Date 포맷 타입 지정
        let date_string = dateFormatter.string(from: TommorowDayDate!) // 포맷된 형식 문자열로 반환
        
        date = date_string
    }

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

    
    //MARK: - 시간표 불러오기 함수
    
    func getTimeSchedule(weekday: String) {
        switch weekday {
        case "mon", "tue", "wed", "thu", "fri":
            let url = "http://54.180.122.62:8080/user/timetable/" + weekday
            AF.request(url,
                       method: .get,
                       encoding: URLEncoding.queryString,
                       headers: ["Authorization": Token!]
            )
            .validate(statusCode: 200..<300)
            .response { result in
                do{
                    let model = try JSONDecoder().decode(TimeGet.self, from: result.data!)
                    print("success")
                    Class1 = model.period1st!
                    print(model.period1st!)
                    
                    Class2 = model.period2nd!
                    print(model.period2nd!)
                    
                    Class3 = model.period3th!
                    print(model.period3th!)
                    
                    Class4 = model.period4th!
                    print(model.period4th!)
                    
                    Class5 = model.period5th!
                    print(model.period5th!)
                    
                    Class6 = model.period6th!
                    print(model.period6th!)
                    
                    Class7 = model.period7th!
                    print(model.period7th!)
                    
                    Class8 = model.period8th!
                    print(model.period8th!)
                    
                    Class9 = model.period9th!
                    print(model.period9th!)
                    
                    Class10 = model.period10th!
                    print(model.period10th!)
                    
                } catch {
                    print(error)
                    print("에런데용 :( ?")
                }
            }
        default:
            Class1 = "시간표가 없어요!"
            
            Class2 = "시간표가 없어요!"
            
            Class3 = "시간표가 없어요!"
            
            Class4 = "시간표가 없어요!"
            
            Class5 = "시간표가 없어요!"
            
            Class6 = "시간표가 없어요!"
            
            Class7 = "시간표가 없어요!"
            
            Class8 = "시간표가 없어요!"
            
            Class9 = "시간표가 없어요!"
            
            Class10 = "시간표가 없어요!"
        }
    }
    
    var body: some View {
        GeometryReader { GeometryProxy in
            ZStack(alignment: .top) {
                ColorManager.BackgroundColor.ignoresSafeArea()
                VStack {
                    HStack {
                        Button {
                            getNowDateTime24()
                        } label: {
                            Text("시간표")
                                .foregroundColor(.white)
                                .font(.custom("NotoSansKR-Bold", size: 60))
                                .padding(.top, GeometryProxy.size.width/5)
                                .padding(.bottom, GeometryProxy.size.width/9 - 10)
                                .padding(.leading, 50)
                        }

                        Spacer()
                    }
                    HStack {
                        Button {
                            getYesterDayDateTime24()
                        } label: {
                            Text("<")
                                .foregroundColor(.white)
                                .font(.custom("NotoSansKR-Regular", size: 15))
                        }

                        Text(date)
                            .foregroundColor(.white)
                            .font(.custom("NotoSansKR-Regular", size: 15))
                        
                        Button {
                            getTommorowDateTime24()
                        } label: {
                            Text(">")
                                .foregroundColor(.white)
                                .font(.custom("NotoSansKR-Regular", size: 15))
                        }
                    }
                    ScrollView() {
                        Text(Class1)
                            .font(.custom("NotoSansKR-Regular", size: 25))
                            .foregroundColor(.black)
                            .frame(width: GeometryProxy.size.width - 100,
                                   height: GeometryProxy.size.height / 11)
                            .background(Color("ScheduleGrayColor"))
                            .cornerRadius(10)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
//                            .shadow(color: .black, radius: 5, x: 0, y: 5)
                        Text(Class2)
                            .font(.custom("NotoSansKR-Regular", size: 25))
                            .foregroundColor(.black)
                            .frame(width: GeometryProxy.size.width - 100,
                                   height: GeometryProxy.size.height / 11)
                            .background(Color("ScheduleGrayColor"))
                            .cornerRadius(10)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                        Text(Class3)
                            .font(.custom("NotoSansKR-Regular", size: 25))
                            .foregroundColor(.black)
                            .frame(width: GeometryProxy.size.width - 100,
                                   height: GeometryProxy.size.height / 11)
                            .background(Color("ScheduleGrayColor"))
                            .cornerRadius(10)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                        Text(Class4)
                            .font(.custom("NotoSansKR-Regular", size: 25))
                            .foregroundColor(.black)
                            .frame(width: GeometryProxy.size.width - 100,
                                   height: GeometryProxy.size.height / 11)
                            .background(Color("ScheduleGrayColor"))
                            .cornerRadius(10)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                        Text(Class5)
                            .font(.custom("NotoSansKR-Regular", size: 25))
                            .foregroundColor(.black)
                            .frame(width: GeometryProxy.size.width - 100,
                                   height: GeometryProxy.size.height / 11)
                            .background(Color("ScheduleGrayColor"))
                            .cornerRadius(10)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                        Text(Class6)
                            .font(.custom("NotoSansKR-Regular", size: 25))
                            .foregroundColor(.black)
                            .frame(width: GeometryProxy.size.width - 100,
                                   height: GeometryProxy.size.height / 11)
                            .background(Color("ScheduleGrayColor"))
                            .cornerRadius(10)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                        Text(Class7)
                            .font(.custom("NotoSansKR-Regular", size: 25))
                            .foregroundColor(.black)
                            .frame(width: GeometryProxy.size.width - 100,
                                   height: GeometryProxy.size.height / 11)
                            .background(Color("ScheduleGrayColor"))
                            .cornerRadius(10)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                        Text(Class8)
                            .font(.custom("NotoSansKR-Regular", size: 25))
                            .foregroundColor(.black)
                            .frame(width: GeometryProxy.size.width - 100,
                                   height: GeometryProxy.size.height / 11)
                            .background(Color("ScheduleGrayColor"))
                            .cornerRadius(10)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                        Text(Class9)
                            .font(.custom("NotoSansKR-Regular", size: 25))
                            .foregroundColor(.black)
                            .frame(width: GeometryProxy.size.width - 100,
                                   height: GeometryProxy.size.height / 11)
                            .background(Color("ScheduleGrayColor"))
                            .cornerRadius(10)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                        Text(Class10)
                            .font(.custom("NotoSansKR-Regular", size: 25))
                            .foregroundColor(.black)
                            .frame(width: GeometryProxy.size.width - 100,
                                   height: GeometryProxy.size.height / 11)
                            .background(Color("ScheduleGrayColor"))
                            .cornerRadius(10)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                    }
                    Spacer()
                        .frame(height: 50)
                }
            }
            .onAppear() {
                getTimeSchedule(weekday: WeekDaydate())
                getNowDateTime24()
            }
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
