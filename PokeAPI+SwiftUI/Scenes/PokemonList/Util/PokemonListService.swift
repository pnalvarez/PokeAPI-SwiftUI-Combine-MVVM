//
//  PokemonListService.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 20/08/22.
//

import Foundation
import Combine

protocol PokemonListServiceProtocol {
    func fetchPokemonList(offset: Int, limit: Int) -> AnyPublisher<[PokemonListItemModel], Error>
    func fetchPokemonDetails(id: String)  -> AnyPublisher<PokemonListDetailsModel, Error>
}

final class PokemonListService {
    private let api: APIProtocol
    
    init(api: APIProtocol = API()) {
        self.api = api
    }
}

extension PokemonListService: PokemonListServiceProtocol {
    func fetchPokemonList(offset: Int, limit: Int) -> AnyPublisher<[PokemonListItemModel], Error> {
        let publisher: AnyPublisher<PokemonListModel, Error> =
        api.request(endpoint: PokemonListEndpoint.pokemonList(offset: offset,
                                                              limit: limit))
        
        return publisher
            .map(\.results)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchPokemonDetails(id: String) -> AnyPublisher<PokemonListDetailsModel, Error> {
        let publisher: AnyPublisher<PokemonListDetailsModel, Error>
        = api.request(endpoint: PokemonListEndpoint.pokemonDetails(id))
        
        return publisher
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
