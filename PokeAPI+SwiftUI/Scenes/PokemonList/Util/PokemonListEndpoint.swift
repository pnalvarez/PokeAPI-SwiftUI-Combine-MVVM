//
//  PokemonListEndpoint.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 20/08/22.
//
import Foundation

enum PokemonListEndpoint: EndpointProtocol {
    case pokemonList(offset: Int, limit: Int)
    case pokemonDetails(_ id: String)
    
    var path: String {
        switch self {
        case .pokemonList:
            return "pokemon/"
        case let .pokemonDetails(id):
            return "pokemon/\(id)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .pokemonList, .pokemonDetails:
            return .get
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case let .pokemonList(offset, limit):
            var dict = [String : String]()
            dict["offset"] = "\(offset)"
            dict["limit"] = "\(limit)"
            return dict
        default:
            return nil
        }
    }
    
    var body: Data? {
        nil
    }
}
