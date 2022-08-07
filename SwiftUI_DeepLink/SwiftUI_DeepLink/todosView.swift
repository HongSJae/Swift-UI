//
//  todosView.swift
//  SwiftUI_DeepLink
//
//  Created by 홍승재 on 2022/08/07.
//

import SwiftUI

struct TodoItem: Identifiable, Hashable {
    var id = UUID()
    var title: String
}

func prepareData() -> [TodoItem] {
    print("prepareData() - called")
    var newList = [TodoItem]()
    for i in 0...20 {
        let newTodo = TodoItem(id: UUID(), title: "내 할일 \(i)")
        print("newTodo.id : \(newTodo.id) / title : \(newTodo.title)")
        newList.append(newTodo)
    }
    return newList
}

struct todosView: View {
    
    @State var todoItems = [TodoItem]()
    
    @State var activeUUID: UUID?
    
    init() {
        _todoItems = State(initialValue: prepareData())
    }
    
    var body: some View {
        NavigationView {
            List(todoItems) { todoItem in
                NavigationLink(destination: Text("\(todoItem.title)")) {
                    Text("\(todoItem.title)")
                }
                
            }
            .navigationTitle(Text("할 일 목록"))
        }
    }
}

struct todosView_Previews: PreviewProvider {
    static var previews: some View {
        todosView()
    }
}
