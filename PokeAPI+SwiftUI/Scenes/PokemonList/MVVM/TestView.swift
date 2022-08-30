//
//  TestView.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 23/08/22.
//

import SwiftUI

struct TestView: View {
    @State var selection: String?
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.ignoresSafeArea()
                NavigationLink(tag: "Next scree", selection: $selection, destination: { Text("Hello world") }) { EmptyView( )}
                Button("Tap here to go to next screen", action: { selection = "Next screen"})
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
