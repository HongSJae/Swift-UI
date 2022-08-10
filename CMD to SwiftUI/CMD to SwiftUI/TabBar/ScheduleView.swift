//
//  ScheduleView.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/09.
//

import SwiftUI

struct ScheduleView: View {
    var body: some View {
        ZStack {
            ColorManager.BackgroundColor.ignoresSafeArea()
            Text("시간표")
                .foregroundColor(.white)
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
