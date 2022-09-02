//
//  PokemonTypeListFactory.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 02/09/22.
//

enum PokemonTypeListFactory {
    static func build() -> PokemonTypesListView<PokemonTypesListViewModel> {
        PokemonTypesListView(viewModel: PokemonTypesListViewModel(coordinator: PokemonTypeListCoordinatorViewModel()))
    }
}
