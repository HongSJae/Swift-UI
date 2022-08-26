//
//  StudentNotice.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/25.
//

import SwiftUI
import Alamofire

struct StudentNotice: View {
    
    @State var notice: [Notice]
    var GeometryProxy: GeometryProxy
    
    //MARK: - 공지사항 받는 함수
        
    func getStudentNotice() {
        print("불러온 토큰은 : \(Token!)")
        let url = BaseURL + "/user/post"
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
                    notice.removeAll()
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
        RefreshableScrollView(onRefresh: { done in
            getStudentNotice()
            done()
        }) {
            VStack {
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
                                .padding(.top, 10)
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
            getStudentNotice()
        }
    }
}

//struct StudentNotice_Previews: PreviewProvider {
//    static var previews: some View {
//        StudentNotice()
//    }
//}
