//
//  ClassinfoView.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/09.
//

import SwiftUI
import Alamofire
import PopupView

var ThisNumber: String = "0000"

struct ClassinfoView: View {
    
    @State var shouldPopupMessage: Bool = false
    
    @State var NameArr: [String] = []
    @State var NumberArr: [String] = []
    
    @State var SendingNumber: String = ""
    @State var SendingName: String = ""
    @State var SendingField: String = ""
    @State var SendingBirth: String = ""
    @State var SendingSeat: CLong? = nil
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    func DetailAPI() {
        print("usernumber: ", SendingNumber)
        let url = BaseURL + "/user/info/" + SendingNumber
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
                SendingName = model.username ?? "이름"
                SendingField = model.birthday ?? "정보 없음"
                SendingBirth = model.field ?? "정보 없음"
                SendingSeat = model.seatNumber
                
            } catch {
                print(error)
                print("정보가 없어요")
            }
        }
    }
    
    //MARK: - 학생정보 불러오기 함수
    
    func ClassAPI() {
        let url = "http://10.156.147.133:3000/user/Info"
        AF.request(url,
                   method: .get,
                   encoding: URLEncoding.queryString,
                   headers: ["Authorization": Token!]
        )
        .validate(statusCode: 200..<300)
        .response { result in
            do{
                let model = try JSONDecoder().decode(Classinfo.self, from: result.data!)
                print("success")
                for i in 0..<model.count {
                    NameArr.append(model[i].username!)
                    NumberArr.append(model[i].number!)
                }
                
            } catch {
                print(error)
                print("정보가 없어요")
            }
        }
    }
    
    func createPopupMessage(geometry: GeometryProxy) -> some View{
        VStack(spacing: 10){
            Detail_Info(UserNumber: $SendingNumber, UserName: $SendingName, UserBirth: $SendingBirth, Userfield: $SendingField, UserSeat: $SendingSeat, shouldPopupMessage: $shouldPopupMessage)
        }
        .frame(width: geometry.size.width - 30, height: geometry.size.height - 150)
        .cornerRadius(30)
        .shadow(radius: 10)
        .padding(.bottom, 20)
        .onAppear {
            
        }
    }
    
    var body: some View {
        GeometryReader { GeometryProxy in
            ZStack(alignment: .top) {
                ColorManager.BackgroundColor.ignoresSafeArea()
                VStack {
                    HStack {
                        Text("학생정보")
                            .foregroundColor(.white)
                            .font(.custom("NotoSansKR-Bold", size: 50))
                            .padding(.top, GeometryProxy.size.width/5)
                            
                            .padding(.leading, 30)
                        Spacer()
                    }
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: columns) {
                            ForEach(0..<NameArr.count, id: \.self) { i in
                                ZStack{
                                    Circle()
                                        .frame(width: GeometryProxy.size.width/4, height: GeometryProxy.size.width/4)
                                        .foregroundColor(.white)
                                    
                                    Image("Logo-B")
                                        .resizable()
                                        .frame(width: GeometryProxy.size.width/4.5, height: GeometryProxy.size.width/5)
                                        .opacity(0.3)
                                    
                                    Text(NameArr[i])
                                        .font(.custom("NotoSansKR-Bold", size: 30))
                                        .foregroundColor(.black)
                                    Button(action: {
                                        SendingNumber = NumberArr[i]
                                        DetailAPI()
                                        self.shouldPopupMessage = true
                                    }){
                                        Circle()
                                            .frame(width: GeometryProxy.size.width/4, height: GeometryProxy.size.width/4)
                                            .opacity(0)
                                    }
                                }
                                .padding(.bottom, 20)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    Spacer()
                        .frame(height: 50)
                }
            }
            .popup(isPresented: $shouldPopupMessage , type: .default, position: .bottom, animation: .spring(), dragToDismiss: true, closeOnTap: false, closeOnTapOutside: true, view: {
                self.createPopupMessage(geometry: GeometryProxy)
            })
            .onAppear {
                ClassAPI()
            }
        }
    }
}


struct ClassinfoView_Previews: PreviewProvider {
    static var previews: some View {
        ClassinfoView(shouldPopupMessage: false)
    }
}

