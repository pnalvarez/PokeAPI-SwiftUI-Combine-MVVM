//
//  PokemonListFactory.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 22/08/22.
//

enum PokemonListFactory {
    static func build() -> PokemonListCoordinatorView<PokemonListCoordinatorViewModel> {
        let coordinator = PokemonListCoordinatorViewModel()
        return PokemonListCoordinatorView(viewModel: coordinator,
                                   content: PokemonListView(viewModel: PokemonListViewModel(coordinator: coordinator)))
    }
}
