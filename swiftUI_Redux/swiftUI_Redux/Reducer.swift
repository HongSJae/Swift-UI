//
//  Reducer.swift
//  swiftUI_Redux
//
//  Created by 홍승재 on 2022/08/08.
//

import Foundation
import UIKit

typealias Reducer<State, Action> = (inout State, Action) -> Void

func appReducer(_ state: inout AppState, _ action: AppAction) -> Void {
    
    switch action {
    case .rollTheDice:
        state.currentDice = ["⚀","⚁","⚂","⚃","⚄","⚅"].randomElement() ?? "⚀"
    }
}
