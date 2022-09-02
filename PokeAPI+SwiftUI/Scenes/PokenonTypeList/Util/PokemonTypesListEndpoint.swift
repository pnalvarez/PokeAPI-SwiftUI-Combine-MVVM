//
//  PokemonTypesListEndpoint.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 02/09/22.
//

import Foundation

enum PokemonTypesListEndpoint: EndpointProtocol {
    case types
    
    var path: String {
        "type/"
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
