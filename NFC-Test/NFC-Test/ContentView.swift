//
//  ContentView.swift
//  NFC Read-Write
//
//  Created by Ming on 1/1/2023.
//

import SwiftUI
import SwiftNFC

struct ContentView: View {
    @ObservedObject var NFCR = NFCReader()
    @ObservedObject var NFCW = NFCWriter()
    
    var body: some View {
        VStack {
            Button {
                read()
            } label: {
                Text("BUTTON")
            }
            .padding()
            .background(Color.green)
        }
    }
    func read() {
        NFCR.read()
    }
    func write() {
        NFCW.msg = NFCR.msg
        NFCW.write()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
