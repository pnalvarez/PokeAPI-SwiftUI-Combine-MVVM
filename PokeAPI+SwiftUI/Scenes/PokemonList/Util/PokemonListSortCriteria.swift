//
//  PokemonListSortCriteria.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 20/08/22.
//

enum PokemonListSortCriteria: String, CaseIterable {
    case alphabetically
    case numerical
    
    var sortingMethod: ([PokemonListDetailsModel]) -> [PokemonListDetailsModel] {
        switch self {
        case .alphabetically:
            return { $0.sorted(by: { $0.name < $1.name })}
        case .numerical:
            return { $0.sorted(by: { $0.id < $1.id })}
        }
    }
    
    var comparisonMethod: (PokemonListDetailsModel, PokemonListDetailsModel) -> Bool {
        switch self {
        case .alphabetically:
            return { $0.name < $1.name }
        case .numerical:
            return { $0.id < $1.id }
        }
    }
}
