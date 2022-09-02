//
//  PokemonTypesListService.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 02/09/22.
//
import Foundation
import Combine

protocol PokemonTypesListServiceProtocol {
    func fetchPokemonTypes() -> AnyPublisher<[PokemonTypeListItemModel], Error>
}

final class PokemonTypesListService {
    private let api: APIProtocol
    
    init(api: APIProtocol = API()) {
        self.api = api
    }
}

extension PokemonTypesListService: PokemonTypesListServiceProtocol {
    func fetchPokemonTypes() -> AnyPublisher<[PokemonTypeListItemModel], Error> {
        let publisher: AnyPublisher<PokemonTypeListModel, Error> = api.request(endpoint: PokemonTypesListEndpoint.types)
            
        return publisher
            .map(\.results)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
