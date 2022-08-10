//
//  ClassinfoView.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/09.
//

import SwiftUI

struct ClassinfoView: View {
    var body: some View {
        ZStack {
            ColorManager.BackgroundColor.ignoresSafeArea()
            Text("학생정보")
                .foregroundColor(.white)
        }
    }
}

struct ClassinfoView_Previews: PreviewProvider {
    static var previews: some View {
        ClassinfoView()
    }
}
