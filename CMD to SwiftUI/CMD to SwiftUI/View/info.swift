//
//  info.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/12.
//

import SwiftUI

struct info: View {
    
    @Binding var shouldPopupMessage: Bool
    
    var L: String
    var C: String
    var R: String
    
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
        GeometryReader { proxy in
            ZStack {
                ColorManager.BackgroundColor.ignoresSafeArea()
                ZStack {
                    StudentsProfile(shouldPopupMessage: $shouldPopupMessage, proxy: proxy, name: L)
                        .offset(x: CalcCircleBgPosition(geometry: proxy, position: "left"), y: 0)
                    StudentsProfile(shouldPopupMessage: $shouldPopupMessage, proxy: proxy, name: C)
                        .offset(x: CalcCircleBgPosition(geometry: proxy, position: "center"), y: 0)
                    StudentsProfile(shouldPopupMessage: $shouldPopupMessage, proxy: proxy, name: R)
                        .offset(x: CalcCircleBgPosition(geometry: proxy, position: "right"), y: 0)
                }
            }
        }
    }
}

//struct info_Previews: PreviewProvider {
//    static var previews: some View {
//        info(L: "강용수", C: "강지인", R: "길근우")
//    }
//}
