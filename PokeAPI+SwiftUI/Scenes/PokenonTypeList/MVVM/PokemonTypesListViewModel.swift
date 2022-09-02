//
//  PokemonTypesListViewModel.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 02/09/22.
//

import Combine

protocol PokemonTypesListViewModelProtocol: ObservableObject {
    var types: [String] { get }
    func onAppear()
}

final class PokemonTypesListViewModel {
    @Published var types: [String] = []
    @Published private var model: [PokemonTypeListItemModel] = []
    
    private let service: PokemonTypesListServiceProtocol
    private let coordinator: PokemonTypeListCoordinatorProtocol
    
    private var subscription: AnyCancellable?
    
    init(service: PokemonTypesListServiceProtocol = PokemonTypesListService(),
         coordinator: PokemonTypeListCoordinatorProtocol) {
        self.service = service
        self.coordinator = coordinator
        initializeSubscriptions()
    }
    
    private func initializeSubscriptions() {
        $model
            .map({ $0.map({ $0.name }) })
            .assign(to: &$types)
    }
}

extension PokemonTypesListViewModel: PokemonTypesListViewModelProtocol {
    func onAppear() {
        subscription = service.fetchPokemonTypes()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    break
                case .finished:
                    break
                }
            }, receiveValue: { value in
                self.model = value
            })
    }
}
