//
//  PokemonListSortCriteria.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 20/08/22.
//

enum PokemonListSortCriteria: String, CaseIterable {
    case alphabetically
    case numerical
    
    var sortingMethod: ([PokemonListItemDataViewModel]) -> [PokemonListItemDataViewModel] {
        switch self {
        case .alphabetically:
            return { $0.sorted(by: { $0.model.name < $1.model.name })}
        case .numerical:
            return { $0.sorted(by: { $0.index < $1.index })}
        }
    }
}
