//
//  PokemonDetailsFactory.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 29/08/22.
//

enum PokemonDetailsFactory {
    static func build(viewModel: PokemonDetailsViewModel = PokemonDetailsViewModel(id: "1")) -> PokemonDetailsView<PokemonDetailsViewModel> {
        PokemonDetailsView(viewModel: viewModel)
    }
}
