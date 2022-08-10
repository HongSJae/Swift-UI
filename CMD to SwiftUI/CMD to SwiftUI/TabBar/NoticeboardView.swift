//
//  NoticeboardView.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/09.
//

import SwiftUI

struct NoticeboardView: View {
    var body: some View {
        ZStack {
            ColorManager.BackgroundColor.ignoresSafeArea()
            Text("게시판")
                .foregroundColor(.white)
        }
    }
}

struct NoticeboardView_Previews: PreviewProvider {
    static var previews: some View {
        NoticeboardView()
    }
}
