//
//  PokemonListCoordinatorViewModel.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 22/08/22.
//

import SwiftUI

protocol PokemonListCoordinatorViewModelProtocol {
    func navigateToPokemonDetails(_ model: PokemonListItemDataViewModel)
}

protocol PokemonListCoordinatorViewModelInput: ObservableObject {
    var navigationItem: String? { get set }
    var pokemon: PokemonListItemDataViewModel? { get }
    var title: String { get }
}

final class PokemonListCoordinatorViewModel: PokemonListCoordinatorViewModelInput, ObservableObject {
    enum NavigationItem {
        static let pokemonDetails = "PokemonDetails"
    }
    
    @Published var navigationItem: String?
    @Published var pokemon: PokemonListItemDataViewModel?
    let title: String = "Pokemon List"
}

extension PokemonListCoordinatorViewModel: PokemonListCoordinatorViewModelProtocol {
    func navigateToPokemonDetails(_ model: PokemonListItemDataViewModel) {
        pokemon = model
        navigationItem = NavigationItem.pokemonDetails
    }
}
