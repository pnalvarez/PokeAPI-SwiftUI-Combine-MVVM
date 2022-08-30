//
//  PokemonListItemView.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 18/08/22.
//

import SwiftUI

struct PokemonListItemView: View {
    let index: String
    let name: String
    
    var body: some View {
        HStack {
            Text(index)
                .font(.system(size: 12))
                .padding(.trailing, 32)
            Text(name)
                .font(.system(size: 12))
                .bold()
            Spacer()
        }
        .padding(12)
        .border(Color.black, width: 1)
        .background(Color.white.cornerRadius(4))
        .listRowBackground(Color.red)
    }
}

struct PokemonListItemView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            PokemonListItemView(index: "1.", name: "Bulbasaur")
                .previewLayout(.sizeThatFits)
        }
        .listStyle(.sidebar)
    }
}
