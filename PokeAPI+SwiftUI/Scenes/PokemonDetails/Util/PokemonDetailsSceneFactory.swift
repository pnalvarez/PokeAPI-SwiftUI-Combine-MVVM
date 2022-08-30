//
//  PokemonDetailsSceneFactory.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 29/08/22.
//

enum PokemonDetailsSceneFactory {
    static func build(id: String) -> PokemonDetailsCoordinatorView<PokemonDetailsCoordinatorViewModel, PokemonDetailsViewModel> {
        let coordinator = PokemonDetailsCoordinatorViewModel()
        let viewModel = PokemonDetailsViewModel(id: id,
                                                coordinator: coordinator)
        return PokemonDetailsCoordinatorView(viewModel: coordinator,
                                             content: PokemonDetailsFactory.build(viewModel: viewModel))
    }
}
