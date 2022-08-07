//
//  Store.swift
//  swiftUI_Redux
//
//  Created by 홍승재 on 2022/08/08.
//

import Foundation
import UIKit

typealias AppStore = Store<AppState, AppAction>

final class Store<State, Action>: ObservableObject {
    @Published private(set) var state: State
    
    private let reducer: Reducer<State, Action>
    
    init(state: State, reducer: @escaping Reducer<State, Action>) {
        self.state = state
        self.reducer = reducer
    }
    
    func dispatch(action: Action) {
        reducer(&self.state, action)
    }
}
