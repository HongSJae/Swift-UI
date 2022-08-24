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
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    
    //MARK: - 학생정보 불러오기 함수
    
    func ClassAPI() {
        let url = "http://54.180.122.62:8080/user/Info"
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
            Detail_Info(UserNumber: NumberArr[0], shouldPopupMessage: $shouldPopupMessage)
        }
        .frame(width: geometry.size.width - 30, height: geometry.size.height - 50)
        .cornerRadius(30)
        .shadow(radius: 10)
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
                            .padding(.bottom, GeometryProxy.size.width/9 - 10)
                            .padding(.leading, 30)
                        Spacer()
                    }
                    .padding(.bottom, 43)
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: columns) {
                            ForEach(0..<NameArr.count, id: \.self) { i in
                                StudentsProfile(shouldPopupMessage: $shouldPopupMessage, proxy: GeometryProxy, name: NameArr[i])
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

