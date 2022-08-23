//
//  ClassinfoView.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/09.
//

import SwiftUI
import Alamofire

struct ClassinfoView: View {
    
    func CalcCircleBgPosition(geometry: GeometryProxy, position: String) -> CGFloat {
        switch position {
        case "left":
            return -(geometry.size.width/3)
        case "right":
            return 0
        case "center":
            return (geometry.size.width/3)
        default:
            return 0
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
                        ForEach(1..<7, content: { index in
                            switch index {
                            case 1:
                                info(L: "강용수", C: "강지인", R: "길근우")
                                Spacer()
                                    .frame(height: GeometryProxy.size.width / 3)
                            case 2:
                                info(L: "김민채", C: "김은오", R: "김정현")
                                Spacer()
                                    .frame(height: GeometryProxy.size.width / 3)
                            case 3:
                                info(L: "김주원", C: "김현민", R: "마재영")
                                Spacer()
                                    .frame(height: GeometryProxy.size.width / 3)
                            case 4:
                                info(L: "유나현", C: "유현담", R: "윤정민")
                                Spacer()
                                    .frame(height: GeometryProxy.size.width / 3)
                            case 5:
                                info(L: "정승훈", C: "정지관", R: "조문성")
                                Spacer()
                                    .frame(height: GeometryProxy.size.width / 3)
                            case 6:
                                info(L: "최하은", C: "한에슬", R: "홍승재")
                                Spacer()
                                    .frame(height: GeometryProxy.size.width / 3)
                            default:
                                info(L: "nil", C: "nil", R: "nil")
                            }
                        })
                    }
                    Spacer()
                        .frame(height: 50)
                }
            }
        }
    }
}
                                

struct ClassinfoView_Previews: PreviewProvider {
    static var previews: some View {
        ClassinfoView()
    }
}
