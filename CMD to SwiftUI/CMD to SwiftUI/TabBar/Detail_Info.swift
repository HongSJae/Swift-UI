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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var number:String = "0000"
    
    @State var UserName = ""
    @State var UserNumber = ""
    @State var UserBirth = ""
    @State var Userfield = ""
    
    //MARK: - 학생정보 불러오기 함수

    func ClassAPI(Number: String) {
        let url = "http://54.180.122.62:8080/user/info/" + Number
        AF.request(url,
                   method: .get,
                   encoding: URLEncoding.queryString,
                   headers: ["Authorization": Token!]
        )
        .validate(statusCode: 200..<300)
        .response { result in
            do{
                let model = try JSONDecoder().decode(Classinfo.self, from: result.data!)
                UserName = model.username ?? "이름"
                UserName = model.username ?? "정보없음"
                UserBirth = model.birthday ?? "정보없음"
                Userfield = model.field ?? "정보없음"
                UserNumber = model.number ?? "정보없음"
                print("success")
                
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
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image("x")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .padding(20)
                        }
                    }
                    Image("Profile")
                        .resizable()
                        .frame(width: proxy.size.width / 5, height: proxy.size.width / 5)
                    Text("이름")
                }
            }
        }
    }
}

struct Detail_Info_Previews: PreviewProvider {
    static var previews: some View {
        Detail_Info(number: "1218")
    }
}
