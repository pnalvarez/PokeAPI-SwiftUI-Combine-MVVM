//
//  FloatingButton.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 01/09/22.
//

import SwiftUI

struct FloatingButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(.white)
                .frame(width: 100, height: 100)
                .background(.blue)
                .clipShape(Circle())
                .shadow(color: .blue,
                        radius: 4,
                        x: 0,
                        y: 0)
        }
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton(title: "Types", action: { })
    }
}
