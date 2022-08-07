//
//  MyFilteredList.swift
//  SwiftUI_Picker
//
//  Created by 홍승재 on 2022/08/07.
//

import SwiftUI

enum School: String, CaseIterable {
    case elemetary = "초등학교"
    case middle = "중학교"
    case high = "고등학고"
}

struct MyFriend: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var school: School
}

struct MyFilteredList: View {
    
    @State private var filteredValue = School.elemetary
    
    @State private var MyFriendList = [MyFriend]()
    
    init() {
        var newList = [MyFriend]()
        
        for i in 0...20 {
            let newFriend = MyFriend(name: "내 친구 \(i)", school: School.allCases.randomElement()!)
            newList.append(newFriend)
        }
        _MyFriendList = State(initialValue: newList)
    }
    
    var body: some View {
        VStack {
            Text("선택된 필터 : \(filteredValue.rawValue)")
            Picker("", selection: $filteredValue) {
                Text("초등학교")
                    .tag(School.elemetary)
                Text("중학교")
                    .tag(School.middle)
                Text("고등학교 ")
                    .tag(School.high)
            }
            .pickerStyle(.segmented)
            List {
                ForEach(MyFriendList.filter {
                    $0.school == filteredValue
                }) { friendItem in
                    HStack {
                        Text("name : \(friendItem.name)")
                        Divider()
                        Text("school : \(friendItem.school.rawValue)")
                    }
                }
            }
//            List {
//                ForEach(MyFriendList, id: \.self) { friendItem in
//
//                    HStack {
//                        Text("name : \(friendItem.name)")
//                        Divider()
//                        Text("school : \(friendItem.school.rawValue)")
//                    }
//                }
//            }
        }
    }
}

struct MyFilteredList_Previews: PreviewProvider {
    static var previews: some View {
        MyFilteredList()
    }
}
