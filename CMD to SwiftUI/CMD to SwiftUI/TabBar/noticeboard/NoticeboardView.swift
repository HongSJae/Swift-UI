//
//  NoticeboardView.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/09.
//

import SwiftUI
import Alamofire
import PopupView

struct Notice: Hashable {
    var Header: String
    var Title: String
}

struct NoticeboardView: View {
    
    @State var notice: [Notice] = []
    @State var selectionValue: Int? = nil
    
    @State var shouldPopupMessage = false
    
    let columns = [
        GridItem(.flexible())
    ]
    
    func createPopupMessage(geometry: GeometryProxy) -> some View{
        VStack(spacing: 10){
            Post_Notice(shouldPopupMessage: $shouldPopupMessage)
        }
        .frame(width: geometry.size.width - 30, height: geometry.size.height - 150)
        .cornerRadius(30)
        .shadow(radius: 20)
        .padding(50)
    }
    
    var body: some View {
        GeometryReader { GeometryProxy in
            ZStack(alignment: .top) {
                ColorManager.BackgroundColor.ignoresSafeArea()
                VStack {
                    HStack {
                        Text("게시판")
                            .foregroundColor(.white)
                            .font(.custom("NotoSansKR-Bold", size: 60))
                            .padding(.top, GeometryProxy.size.width/5)
                            .padding(.bottom, GeometryProxy.size.width/10 - 10)
                            .padding(.leading, 30)
                        Spacer()
                    }
                    .padding(.bottom, 20)
                    Picker(selection: Binding<Int>(
                        get: { self.selectionValue ?? 0 },
                                    set: { tag in
                                        withAnimation { // needed explicit for transitions
                                            self.selectionValue = tag
                                        }
                                    }),
                                       label: Text("Authentication Path")) {
                                    Text("교사").tag(0)
                                    Text("학생").tag(1)
                                }
                    .pickerStyle(.segmented)
                    .background(Color("ScheduleGrayColor"))
                    .cornerRadius(8)
                    .padding(.horizontal, 50)
                    
                    if nil ==  selectionValue {
                        TeacherNotice(notice: notice,  GeometryProxy: GeometryProxy)
                            .transition(.move(edge: .leading))
                    }
                    if selectionValue == 0 {
                        TeacherNotice(notice: notice,  GeometryProxy: GeometryProxy)
                            .transition(.move(edge: .leading))
                    }
                    if selectionValue == 1 {
                        StudentNotice(notice: notice,  GeometryProxy: GeometryProxy)
                            .transition(.move(edge: .trailing))
                    }
                }
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        if selectionValue == 0 {
                        }
                        if selectionValue == 1 {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color("bgColor"))
                                    .frame(width: 64, height: 64)
                                    .padding(.trailing, 30)
                                    .padding(.bottom, 30)
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 64, height: 64)
                                    .shadow(radius: 10)
                                    .padding(.trailing, 30)
                                    .padding(.bottom, 30)
                                    .onTapGesture {
                                        shouldPopupMessage = true
                                    }
                            }
                        }
                    }
                }
            }
            .padding(.bottom, 50)
            .popup(isPresented: $shouldPopupMessage , type: .default, position: .bottom, animation: .spring(), dragToDismiss: true, closeOnTap: false, closeOnTapOutside: true, view: {
                self.createPopupMessage(geometry: GeometryProxy)
            })
        }
    }
}

struct NoticeboardView_Previews: PreviewProvider {
    static var previews: some View {
        NoticeboardView()
    }
}
