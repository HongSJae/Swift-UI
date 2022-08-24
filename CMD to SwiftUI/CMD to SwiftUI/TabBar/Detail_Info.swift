//
//  Detail_Info.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/12.
//

import SwiftUI
import Alamofire

struct bginfo {
    // create static variables for custom colors
    static let BackgroundColor = Color("Classinfo")
    
    //... add the rest of your colors here
}

struct Detail_Info: View {
    
    var UserNumber: String
    
    @State var UserName = ""
    @State var UserBirth = ""
    @State var Userfield = ""
    
    @Binding var shouldPopupMessage: Bool
    
    //MARK: - 학생정보 불러오기 함수
    
    func ClassAPI() {
        let url = "http://54.180.122.62:8080/user/info/" + UserNumber
        AF.request(url,
                   method: .get,
                   encoding: URLEncoding.queryString,
                   headers: ["Authorization": Token!]
        )
        .validate(statusCode: 200..<300)
        .response { result in
            do{
                let model = try JSONDecoder().decode(DetailInfo.self, from: result.data!)
                print("success")
                UserName = model.username!
                UserBirth = model.birthday ?? "정보 없음"
                Userfield = model.field ?? "정보 없음"
                
            } catch {
                print(error)
                print("정보가 없어요")
            }
        }
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .top) {
                bginfo.BackgroundColor.ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            shouldPopupMessage = false
                        }) {
                            Image(systemName: "xmark")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 16, height: 16)
                                .padding(20)
                        }
                    }
                    ZStack{
                        Circle()
                            .frame(width: proxy.size.width/3.5, height: proxy.size.width/3.5)
                            .foregroundColor(.white)
                        
                        Image("Logo-B")
                            .resizable()
                            .frame(width: proxy.size.width/4.5, height: proxy.size.width/5)
                            .opacity(0.3)
                        
                        Text(UserName)
                            .font(.custom("NotoSansKR-Bold", size: 30))
                            .foregroundColor(.black)
                    }
                    VStack(alignment: .leading) {
                        Text("회원 정보")
                            .font(.custom("NotoSansKR-Bold", size: 20))
                            .foregroundColor(.white)
                            .padding(.top, 20)
                            .padding(.leading, 30)
                    }
                }
            }
            .onAppear {
                ClassAPI()
            }
        }
    }
}

//struct Detail_Info_Previews: PreviewProvider {
//    static var previews: some View {
//        Detail_Info(number: "1218")
//    }
//}
