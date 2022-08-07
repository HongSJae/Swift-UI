//
//  ContentView.swift
//  swiftUI_Redux
//
//  Created by 홍승재 on 2022/08/08.
//

import SwiftUI

struct ContentView: View {
    
    let store = AppStore(state: AppState.init(currentDice: "⚀"), reducer: appReducer(_:_:))
    
    var body: some View {
        DiceView().environmentObject(store)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
