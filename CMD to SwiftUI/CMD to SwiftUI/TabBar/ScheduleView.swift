//
//  ScheduleView.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/09.
//

import SwiftUI

func getNowDateTime24() -> String {
        // [date 객체 사용해 현재 날짜 및 시간 24시간 형태 출력 실시]
        let nowDate = Date() // 현재의 Date 날짜 및 시간
        let dateFormatter = DateFormatter() // Date 포맷 객체 선언
        dateFormatter.locale = Locale(identifier: "ko") // 한국 지정
        
        dateFormatter.dateFormat = "yyyy년 M월 d일 E요일" // Date 포맷 타입 지정
        let date_string = dateFormatter.string(from: nowDate) // 포맷된 형식 문자열로 반환

        return date_string
    }

struct ScheduleView: View {
    var body: some View {
        GeometryReader { GeometryProxy in
            ZStack(alignment: .top) {
                ColorManager.BackgroundColor.ignoresSafeArea()
                VStack {
                    HStack {
                        Text("시간표")
                            .foregroundColor(.white)
                            .font(.custom("NotoSansKR-Bold", size: 60))
                            .padding(.top, 74)
                            .padding(.leading, 50)
                        Spacer()
                    }
                    Spacer()
                        .frame(height: 43)
                    HStack {
                        Spacer()
                        Text(getNowDateTime24())
                            .foregroundColor(.white)
                            .font(.custom("NotoSansKR-Regular", size: 15))
                            .padding(.trailing, 50)
                    }
                    ScrollView() {
                        Text(schedule.class1)
                            .font(.custom("NotoSansKR-Regular", size: 25))
                            .frame(width: GeometryProxy.size.width - 100,
                                   height: GeometryProxy.size.height / 11)
                            .background(Color("ScheduleGrayColor"))
                            .cornerRadius(10)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
//                            .shadow(color: .black, radius: 5, x: 0, y: 5)
                        Text(schedule.class2)
                            .font(.custom("NotoSansKR-Regular", size: 25))
                            .frame(width: GeometryProxy.size.width - 100,
                                   height: GeometryProxy.size.height / 11)
                            .background(Color("ScheduleGrayColor"))
                            .cornerRadius(10)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                        Text(schedule.class3)
                            .font(.custom("NotoSansKR-Regular", size: 25))
                            .frame(width: GeometryProxy.size.width - 100,
                                   height: GeometryProxy.size.height / 11)
                            .background(Color("ScheduleGrayColor"))
                            .cornerRadius(10)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                        Text(schedule.class4)
                            .font(.custom("NotoSansKR-Regular", size: 25))
                            .frame(width: GeometryProxy.size.width - 100,
                                   height: GeometryProxy.size.height / 11)
                            .background(Color("ScheduleGrayColor"))
                            .cornerRadius(10)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                        Text(schedule.class5)
                            .font(.custom("NotoSansKR-Regular", size: 25))
                            .frame(width: GeometryProxy.size.width - 100,
                                   height: GeometryProxy.size.height / 11)
                            .background(Color("ScheduleGrayColor"))
                            .cornerRadius(10)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                        Text(schedule.class6)
                            .font(.custom("NotoSansKR-Regular", size: 25))
                            .frame(width: GeometryProxy.size.width - 100,
                                   height: GeometryProxy.size.height / 11)
                            .background(Color("ScheduleGrayColor"))
                            .cornerRadius(10)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                        Text(schedule.class7)
                            .font(.custom("NotoSansKR-Regular", size: 25))
                            .frame(width: GeometryProxy.size.width - 100,
                                   height: GeometryProxy.size.height / 11)
                            .background(Color("ScheduleGrayColor"))
                            .cornerRadius(10)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                        Text(schedule.class8)
                            .font(.custom("NotoSansKR-Regular", size: 25))
                            .frame(width: GeometryProxy.size.width - 100,
                                   height: GeometryProxy.size.height / 11)
                            .background(Color("ScheduleGrayColor"))
                            .cornerRadius(10)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                        Text(schedule.class9)
                            .font(.custom("NotoSansKR-Regular", size: 25))
                            .frame(width: GeometryProxy.size.width - 100,
                                   height: GeometryProxy.size.height / 11)
                            .background(Color("ScheduleGrayColor"))
                            .cornerRadius(10)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                        Text(schedule.class10)
                            .font(.custom("NotoSansKR-Regular", size: 25))
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
                print(schedule)
            }
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
