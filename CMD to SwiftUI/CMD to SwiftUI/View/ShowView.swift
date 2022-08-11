//
//  MyView.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/10.
//

import SwiftUI

struct ShowView: View {
    
    var Number: Int
    
    var body: some View {
        VStack {
            switch Number {
            case 1 :
                ScheduleView()
            case 2 :
                ClassinfoView()
            case 3 :
                NoticeboardView()
            case 4 :
                MyView()
            default:
                ScheduleView()
            }
        }
        
    }
}
 
struct ShowView_Previews: PreviewProvider {
    static var previews: some View {
        ShowView(Number: 1)
    }
}
