//
//  TeacherNotice.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/25.
//

import SwiftUI
import Alamofire

struct TeacherNotice: View {
    
    @State var notice: [Notice]
    var columns: [GridItem]
    var GeometryProxy: GeometryProxy
    
    func getTeacherNotice() {
        print("불러온 토큰은 : \(Token!)")
        let url = "http://10.156.147.133:3000/user/noticeBoard"
        AF.request(url,
                   method: .get,
                   encoding: URLEncoding.queryString,
                   headers: ["Authorization": Token!]
        )
        .validate(statusCode: 200..<300)
        .response { result in
            do{
                let model = try JSONDecoder().decode(Noticeboard.self, from: result.data!)
                
                print("success")
                if model.count == 0 {
                    self.notice.append(Notice(Header: "게시물이 없어요",
                                          Title: "추가된 게시물이 없습니다."))
                } else {
                    for i in 0..<model.count {
                        self.notice.append(Notice(Header: model[i].title, Title: model[i].contents))
                        print(notice)
                    }
                }
            } catch {
                print(error)
                print("에런데용 :( ?")
            }
        }
    }

    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(0..<notice.count, id: \.self) { i in
                    ZStack(alignment: .top){
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: GeometryProxy.size.width - 30, height: GeometryProxy.size.width / 2)
                            .cornerRadius(30)
                        VStack {
                            Text(notice[i].Header)
                                .foregroundColor(.black)
                                .font(.custom("NotoSansKR-Bold", size: 20))
                            Text(notice[i].Title)
                                .foregroundColor(.black)
                                .font(.custom("NotoSansKR-Regular", size: 20))
                        }
                    }
                    .padding(.bottom, 20)
                }
            }
        }
        .onAppear {
            getTeacherNotice()
        }
    }
}
