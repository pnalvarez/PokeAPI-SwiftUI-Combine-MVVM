//
//  PokemonDetailsEndpoint.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 29/08/22.
//
import Foundation

enum PokemonDetailsEndpoint: EndpointProtocol {
    case details(_ id: String)
    
    var path: String {
        switch self {
        case let .details(id):
            return "pokemon/\(id)"
        }
    }
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    var headers: [String : String]? {
        nil
    }
    
    var body: Data? {
        nil
    }
}
