//
//  Myview.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/09.
//

import SwiftUI

struct Myview: View {
    var body: some View {
        ZStack {
            ColorManager.BackgroundColor.ignoresSafeArea()
            Text("마이페이지")
                .foregroundColor(.white)
        }
    }
}

struct Myview_Previews: PreviewProvider {
    static var previews: some View {
        Myview()
    }
}
