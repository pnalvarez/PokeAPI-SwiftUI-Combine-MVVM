//
//  PokemonTypeListCoordinatorViewModel.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 01/09/22.
//

import Combine

protocol PokemonTypeListCoordinatorViewModelProtocol: ObservableObject {
    var title: String { get }
}

protocol PokemonTypeListCoordinatorProtocol {
    
}

final class PokemonTypeListCoordinatorViewModel {
    let title: String = "Types"
}

extension PokemonTypeListCoordinatorViewModel: PokemonTypeListCoordinatorViewModelProtocol {
    
}

extension PokemonTypeListCoordinatorViewModel: PokemonTypeListCoordinatorProtocol {
    
}
