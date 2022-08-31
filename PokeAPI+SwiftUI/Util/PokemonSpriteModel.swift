//
//  PokemonSpriteModel.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 31/08/22.
//

struct PokemonSpriteModel: Decodable {
    let frontDefault: String
    
    private enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
