//
//  ContentView.swift
//  SwiftUI_DeepLink
//
//  Created by 홍승재 on 2022/08/07.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab = TabIdentifier.todos
    
    var body: some View {
        TabView(selection: $selectedTab) {
            todosView().tabItem {
                VStack {
                    Image(systemName: "list.bullet")
                    Text("할일목록")
                }
            } .tag(TabIdentifier.todos)
            ProfileView().tabItem {
                VStack {
                    Image(systemName: "person.crop.circle.fill")
                    Text("할일목록")
                }
            } .tag(TabIdentifier.profile)
        }
        .onOpenURL { url in
            
            guard let tabid = url.tabIdentifier else { return }
            selectedTab = tabid
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum TabIdentifier: Hashable {
    case todos, profile
}

enum PageIdentifier: Hashable {
    case todoItem(id: UUID)
}

extension URL {
    var isDeepLink: Bool {
        return scheme == "deeplink-swiftui"
    }
    
    var tabIdentifier: TabIdentifier? {
        guard isDeepLink else { return nil }
        
        switch host {
        case "todos":
            return .todos
        case "profile":
            return .profile
        default:
            return nil
        }
    }
    
    var DetailPage: PageIdentifier? {
        guard let tabId = tabIdentifier,
              pathComponents.count > 1,
              let uuid = UUID(uuidString: pathComponents[1])
        else { return nil}
        
        switch tabId {
        case .todos:
            return .todoItem(id: uuid)
        default:
            return nil
        }
    }
}
