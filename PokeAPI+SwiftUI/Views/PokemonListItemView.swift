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
    let url: URL?
    let types: [String]
    
    var body: some View {
        HStack {
            Text(index)
                .font(.system(size: 12))
                .padding(.trailing, 32)
            PokemonImageView(url: url)
            Text(name)
                .font(.system(size: 12))
                .bold()
            Spacer()
            ForEach(types, id: \.self) { type in
                Circle()
                    .frame(width: 20,
                           height:20)
                    .foregroundColor(PokemonTypeUIModel(rawValue: type)?.color)
            }
        }
        .padding(12)
        .border(Color.black, width: 1)
        .background(Color.white.cornerRadius(4))
    }
}

struct PokemonListItemView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            PokemonListItemView(index: "1.", name: "Bulbasaur", url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/8.png"), types: ["water"])
                .previewLayout(.sizeThatFits)
        }
        .listStyle(.sidebar)
    }
}
