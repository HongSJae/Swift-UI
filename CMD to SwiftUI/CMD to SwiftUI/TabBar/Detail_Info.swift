//
//  Detail_Info.swift
//  CMD to SwiftUI
//
//  Created by 홍승재 on 2022/08/12.
//

import SwiftUI

struct Detail_Info: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack(alignment: .top) {
            ColorManager.BackgroundColor.ignoresSafeArea()
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
            }
        }
    }
}

struct Detail_Info_Previews: PreviewProvider {
    static var previews: some View {
        Detail_Info()
    }
}
