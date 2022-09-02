//
//  PokemonTypesListModel.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 02/09/22.
//

struct PokemonTypeListModel: Decodable {
    let results: [PokemonTypeListItemModel]
}

struct PokemonTypeListItemModel: Decodable {
    let id: String
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case url
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        
        let url = try container.decode(String.self, forKey: .url)
        self.id = String(url.split(separator: "/").last ?? "")
    }
}
