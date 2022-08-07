//
//  ContentView.swift
//  SwiftUI_menu
//
//  Created by 홍승재 on 2022/08/07.
//

import SwiftUI

let myPets = ["멍멍이🐶", "야옹이🐱", "찍찍이🐭"]

struct ContentView: View {
    
    @State private var shouleShowAlert: Bool = false
    @State private var myText: String = ""
    @State private var selected: Int = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                Text("\(myPets[selected])")
                    .font(.system(size: 60))
                    .bold()
                Text("우측 상단에 메뉴바를 눌러주세요")
                    .font(.title2)
                    .fontWeight(.black)
                Spacer()
            }
            .padding()
            .navigationTitle("hi")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing,
                            content: {
                    Menu {
                        Button {
                            shouleShowAlert = true
                            myText = "오늘도 빡코딩!"
                        } label: {
                            Label("오늘도 빡코딩", systemImage: "flame.fill")
                        }
                        Button {
                            shouleShowAlert = true
                            myText = "집에서 쉬는날~"
                        } label: {
                            Label("오늘은 집에서 쉬는 날", systemImage: "house.fill")
                        }
                        
                        Section {
                            Button {
                            } label: {
                                Label("새 파일 만들기", systemImage: "doc.fill")
                            }
                            Button {
                            } label: {
                                Label("새 폴더 만들기", systemImage: "folder.fill")
                            }
                        }
                        Section {
                            Button {
                            } label: {
                                Label("파일 모두 삭제", systemImage: "doc.fill")
                            }
                            Button {
                            } label: {
                                Label("새 폴더 만들기", systemImage: "trash.fill")
                            }
                        }
                        Picker(selection: $selected,
                               label: Text("애완동물 선택")) {
                            ForEach(myPets.indices, id: \.self, content: { index in
                                Text("\(myPets[index])").tag(index)
                            })
                        }
                    } label: {
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: 50, height: 50)
                            .overlay(
                                Label("더보기", systemImage: "ellipsis")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white))
                    }
                })
            }
            .alert(isPresented: $shouleShowAlert) {
                Alert(title: Text("알림"), message: Text("\(myText)"), dismissButton: .default(Text("확인")))
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
