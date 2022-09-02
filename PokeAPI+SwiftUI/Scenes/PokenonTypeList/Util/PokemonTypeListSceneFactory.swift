//
//  PokemonTypeListSceneFactory.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 02/09/22.
//

enum PokemonTypeListSceneFactory {
    static func build() -> PokemonTypeListCoordinatorView<PokemonTypeListCoordinatorViewModel, PokemonTypesListViewModel> {
        let coordinator = PokemonTypeListCoordinatorViewModel()
        let viewModel = PokemonTypesListViewModel(coordinator: coordinator)
        return PokemonTypeListCoordinatorView(viewModel: coordinator,
                                              content: PokemonTypesListView(viewModel: viewModel))
    }
}
