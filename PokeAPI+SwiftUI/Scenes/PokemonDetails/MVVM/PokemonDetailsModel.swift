//
//  PokemonDetailsModel.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 22/08/22.
//

struct PokemonDetailsModel: Decodable {
    let name: String
    let baseExperience: Int
    let height: Int
    let image: String
    let types: [String]
    let weight: Int
    
    private enum CodingKeys: String, CodingKey {
        case name
        case baseExperience = "base_experience"
        case height
        case sprites
        case types
        case weight
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.baseExperience = try container.decode(Int.self, forKey: .baseExperience)
        self.height = try container.decode(Int.self, forKey: .height)
        self.weight = try container.decode(Int.self, forKey: .weight)
        
        let typesArray = try container.decode([PokemonTypeItemModel].self, forKey: .types)
        self.types = typesArray.map({ $0.type.name })
        
        let sprites = try container.decode(PokemonSpriteModel.self, forKey: .sprites)
        self.image = sprites.frontDefault
    }
}
