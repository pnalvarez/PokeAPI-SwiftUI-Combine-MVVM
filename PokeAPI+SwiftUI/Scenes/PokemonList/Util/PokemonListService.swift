//
//  PokemonListService.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 20/08/22.
//

import Foundation
import Combine

protocol PokemonListServiceProtocol {
    func fetchPokemonList(offset: Int, limit: Int) -> AnyPublisher<[PokemonListItemModel], Never>
}

final class PokemonListService {
    private let api: APIProtocol
    
    init(api: APIProtocol = API()) {
        self.api = api
    }
}

extension PokemonListService: PokemonListServiceProtocol {
    func fetchPokemonList(offset: Int, limit: Int) -> AnyPublisher<[PokemonListItemModel], Never> {
        let publisher: AnyPublisher<PokemonListModel, Error> =
        api.request(endpoint: PokemonListEndpoint.pokemonList(offset: offset,
                                                              limit: limit))
        
        return publisher
            .map(\.results)
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveOutput: {
                print("Service received output: \($0)")
            })
            .eraseToAnyPublisher()
    }
}
