//
//  PokemonListItemModel.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 20/08/22.
//

import Foundation

struct PokemonListItemDataViewModel {
    let index: Int
    let model: PokemonListItemModel
    
    static var defaultValue: PokemonListItemDataViewModel {
        .init(index: 0, model: PokemonListItemModel(name: "", url: ""))
    }
}

struct PokemonListItemModel: Decodable {
    let name: String
    let url: String
}

struct PokemonListModel: Decodable {
    let results: [PokemonListItemModel]
}
