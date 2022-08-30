//
//  PokemonDetailsService.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 29/08/22.
//
import Foundation
import Combine

protocol PokemonDetailsServiceProtocol: AnyObject {
    func fetchDetails(id: String) -> AnyPublisher<PokemonDetailsModel, Error>
}

final class PokemonDetailsService: PokemonDetailsServiceProtocol {
    private let api: APIProtocol
    
    init(api: APIProtocol = API()) {
        self.api = api
    }
    
    func fetchDetails(id: String) -> AnyPublisher<PokemonDetailsModel, Error> {
        api.request(endpoint: PokemonDetailsEndpoint.details(id))
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

