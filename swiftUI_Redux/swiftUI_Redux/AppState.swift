//
//  AppState.swift
//  swiftUI_Redux
//
//  Created by 홍승재 on 2022/08/08.
//

import Foundation

struct AppState {
    var currentDice: String = "" {
        didSet {
            print("currentDice : \(currentDice)", #fileID, #function)
        }
    }
}
