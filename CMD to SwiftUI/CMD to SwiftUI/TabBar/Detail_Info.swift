//
//  Detail_Info.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/12.
//

import SwiftUI

struct bginfo {
    // create static variables for custom colors
    static let BackgroundColor = Color("Classinfo")
    
    //... add the rest of your colors here
}

struct Detail_Info: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .top) {
                bginfo.BackgroundColor.ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image("x")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .padding(20)
                        }
                    }
                    Image("Logo")
                        .resizable()
                        .frame(width: proxy.size.width / 5, height: proxy.size.width / 5)
                    Text("")
                }
            }
        }
    }
}

struct Detail_Info_Previews: PreviewProvider {
    static var previews: some View {
        Detail_Info()
    }
}
