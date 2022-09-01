//
//  PokemonImageView.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 01/09/22.
//

import SwiftUI

struct PokemonImageView: View {
    let url: URL?
    private let dimension: CGFloat = 52
    
    var body: some View {
        AsyncImage(url: url,
                   content: { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: dimension,
                       height: dimension)
        }, placeholder: {
            Image("pokeball_default")
                .resizable()
                .scaledToFit()
                .frame(width: dimension,
                       height: dimension)
        })
    }
}

struct PokemonImageView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImageView(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/8.png"))
    }
}
