//
//  PokemonListDetailsModel.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 01/09/22.
//

struct PokemonListDetailsModel: Decodable {
    let id: Int
    let name: String
    let image: String
    let types: [String]
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case sprites
        case types
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        
        let typesArray = try container.decode([PokemonTypeItemModel].self, forKey: .types)
        self.types = typesArray.map({ $0.type.name })
        
        let sprites = try container.decode(PokemonSpriteModel.self, forKey: .sprites)
        self.image = sprites.frontDefault
    }
    
    init(id: Int,
         name: String,
         image: String,
         types: [String]) {
        self.id = id
        self.name = name
        self.image = image
        self.types = types
    }
}
