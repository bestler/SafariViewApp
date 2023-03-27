//
//  ContentView.swift
//  SafariViewApp
//
//  Created by Simon Bestler on 24.03.23.
//

import SwiftUI

struct ContentView: View {

    @State private var link: String = ""
    @State private var url: URL?

    private var dismissButtonStyle = SFSafariView.DismissButtonStyle.cancel

    var body: some View {
        VStack {
            TextField("Link to open in SafariView", text: $link)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocorrectionDisabled()
                .autocapitalization(.none)
                .keyboardType(.URL)
                .textContentType(.URL)
                .padding()
                .onSubmit(of: .text) {
                    presentLink()
                }
            Button("Open") {
                presentLink()
            }
            .buttonStyle(.borderedProminent)

        }

        .sheet(item: $url) { url in
            SFSafariView(url: url)
        }
    }

    private func presentLink() {
        let newURL = URL(string: link)
        if let newURL = newURL {
            url = newURL
        }else {
            print("No url")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension URL: Identifiable {
    public var id: Int {
        return self.hashValue
    }
}
