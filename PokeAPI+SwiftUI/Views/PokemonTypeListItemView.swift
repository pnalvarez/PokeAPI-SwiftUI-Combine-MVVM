//
//  PokemonTypeListItemView.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 02/09/22.
//

import SwiftUI

struct PokemonTypeListItemView: View {
    let name: String
    
    var body: some View {
        HStack {
            Text(name)
                .font(.system(.body))
                .bold()
                .padding(.leading, 32)
                .frame(height: 64)
            Spacer()
        }
        .background(PokemonTypeUIModel(rawValue: name)?.color)
    }
}

struct PokemonTypeListItemView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonTypeListItemView(name: "water")
            .padding()
    }
}
