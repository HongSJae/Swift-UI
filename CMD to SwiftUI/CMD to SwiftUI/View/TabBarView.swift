//
//  TabBar.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/09.
//

import SwiftUI

enum TabIndex {
    case schedule, classinfo, noticeboard, my
}

struct TabBar: View {
    @State var tabIndex = TabIndex.schedule
    @State var largerScale: CGFloat = 1.6
    
    func changeMyView(tableIndex: TabIndex) -> MyView {
        switch tabIndex {
        case .schedule:
            return MyView(Number: 1)
        case .classinfo:
            return MyView(Number: 2)
        case .noticeboard:
            return MyView(Number: 3)
        case .my:
            return MyView(Number: 4)
        }
    }
    
    func CalcCircleBgPosition(geometry: GeometryProxy, tableIndex: TabIndex) -> CGFloat {
        switch tabIndex {
        case .schedule:
            return -(geometry.size.width/2.7)
        case .classinfo:
            return -(geometry.size.width/7.7)
        case .noticeboard:
            return (geometry.size.width/7.7)
        case .my:
            return (geometry.size.width/2.7)
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack(alignment: .bottom) {
                    ScheduleView()
                    changeMyView(tableIndex: tabIndex)
                    Circle()
                        .frame(width: 90, height: 90)
                        .offset(x: CalcCircleBgPosition(geometry: geometry, tableIndex: tabIndex), y: 15)
                        .foregroundColor(.white)
                    HStack(spacing: 0) {
                        Button {
                            print("시간표 클릭")
                            withAnimation {
                                tabIndex = .schedule
                            }
                        } label: {
                            Image(systemName: "calendar")
                                .font(.system(size: 25))
                                .scaleEffect(tabIndex == .schedule ? largerScale : 1)
                                .foregroundColor(.gray)
                                .frame(width: geometry.size.width/4, height: 50)
                                .offset(y: tabIndex == .schedule ? -10 : 0)
                        }
                        .background(.white)
                        Button {
                            print("반 정보 클릭")
                            withAnimation {
                                tabIndex = .classinfo
                            }
                        } label: {
                            Image(systemName: "info")
                                .font(.system(size: 25))
                                .scaleEffect(tabIndex == .classinfo ? largerScale : 1)
                                .foregroundColor(.gray)
                                .frame(width: geometry.size.width/4, height: 50)
                                .offset(y: tabIndex == .classinfo ? -10 : 0)
                        }
                        .background(.white)
                        
                        Button {
                            print("게시판 클릭")
                            withAnimation {
                                tabIndex = .noticeboard
                            }
                        } label: {
                            Image(systemName: "speaker")
                                .font(.system(size: 25))
                                .scaleEffect(tabIndex == .noticeboard ? largerScale : 1)
                                .foregroundColor(.gray)
                                .frame(width: geometry.size.width/4, height: 50)
                                .offset(y: tabIndex == .noticeboard ? -10 : 0)
                        }
                        .background(.white)
                        Button {
                            print("게시판 클릭")
                            withAnimation {
                                tabIndex = .my
                            }
                        } label: {
                            Image(systemName: "person")
                                .font(.system(size: 25))
                                .scaleEffect(tabIndex == .my ? largerScale : 1)
                                .foregroundColor(.gray)
                                .frame(width: geometry.size.width/4, height: 50)
                                .offset(y: tabIndex == .my ? -10 : 0)
                        }
                        .background(.white)
                    }
                }
                Rectangle()
                    .frame(height:
                            UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 0 : 20)
                    .foregroundColor(.white)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    struct TabBar_Previews: PreviewProvider {
        static var previews: some View {
            TabBar()
        }
    }
}
