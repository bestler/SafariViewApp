//
//  ContentView.swift
//  SafariViewApp
//
//  Created by Simon Bestler on 24.03.23.
//

import SwiftUI

struct ContentView: View {

    @State private var isShowSafari: Bool = false

    private var dismissButtonStyle = SFSafariView.DismissButtonStyle.cancel

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .onTapGesture {
            isShowSafari.toggle()
        }
        .sheet(isPresented: $isShowSafari, content: {
            SFSafariView(url: URL(string: "https://apple.de")!)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
