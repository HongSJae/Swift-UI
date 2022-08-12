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
       Group {
         Text("Modal view")
         Button(action: {
            self.presentationMode.wrappedValue.dismiss()
         }) {
           Text("Dismiss")
         }
       }
     }
}

struct Detail_Info_Previews: PreviewProvider {
    static var previews: some View {
        Detail_Info()
    }
}
