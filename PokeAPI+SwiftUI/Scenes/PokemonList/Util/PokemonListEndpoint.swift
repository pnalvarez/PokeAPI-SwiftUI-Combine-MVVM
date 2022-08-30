//
//  PokemonListEndpoint.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 20/08/22.
//
import Foundation

enum PokemonListEndpoint: EndpointProtocol {
    case pokemonList(offset: Int, limit: Int)
    
    var path: String {
        switch self {
        case .pokemonList:
            return "pokemon/"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .pokemonList:
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
        }
    }
    
    var body: Data? {
        nil
    }
}
