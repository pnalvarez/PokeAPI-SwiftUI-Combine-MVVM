//
//  PokemonTypeModel.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 31/08/22.
//

struct PokemonTypeItemModel: Decodable {
    let slot: Int
    let type: PokemonTypeModel
}

struct PokemonTypeModel: Decodable {
    let name: String
    let url: String
}
