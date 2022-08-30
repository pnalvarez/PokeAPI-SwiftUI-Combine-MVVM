//
//  PokemonListViewModel.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 20/08/22.
//

import Combine

protocol PokemonListViewModelProtocol: ObservableObject {
    var pokemonList: [PokemonListItemDataViewModel] { get set }
    var sortCriteria: PokemonListSortCriteria { get set }
    var listIsFull: Bool { get }
    var title: String { get }
    
    func onAppear()
    func itemDidAppear(_ index: Int)
    func didSelectItem(_ index: Int)
}

final class PokemonListViewModel: PokemonListViewModelProtocol {
    @Published var pokemonList: [PokemonListItemDataViewModel] = []
    @Published var sortCriteria: PokemonListSortCriteria = .numerical
    @Published var listIsFull: Bool = false
    
    let title: String = "Pokemon List"
    
    private let service: PokemonListServiceProtocol
    private let coordinator: PokemonListCoordinatorViewModelProtocol
    
    @Published var currentIndex: Int = 0
    private let pageSize: Int = 20
    
    private var cancellables = Set<AnyCancellable>()
    
    init(service: PokemonListServiceProtocol = PokemonListService(),
         coordinator: PokemonListCoordinatorViewModelProtocol = PokemonListCoordinatorViewModel()) {
        self.service = service
        self.coordinator = coordinator
        $sortCriteria.sink(receiveValue: {
            self.pokemonList = $0.sortingMethod(self.pokemonList)
        })
        .store(in: &cancellables)
    }
    
    func onAppear() {
        fetchPokemonList {
            self.currentIndex += self.pageSize - 1
        }
    }
    
    func itemDidAppear(_ index: Int) {
        print("item appear \(index)")
        guard index >= currentIndex - 2 else { return }
        currentIndex += pageSize
        fetchPokemonList()
    }
    
    func didSelectItem(_ index: Int) {
        coordinator.navigateToPokemonDetails(pokemonList[index])
    }
    
    private func fetchPokemonList(completion: () -> Void = { }) {
        service.fetchPokemonList(offset: currentIndex, limit: pageSize)
            .map(mapToDataViewModel)
            .append(to: &pokemonList)
            .assign(to: &$pokemonList,
                    completion: completion)
    }
    
    private func mapToDataViewModel(_ array: [PokemonListItemModel]) -> [PokemonListItemDataViewModel] {
        var newArray = [PokemonListItemDataViewModel]()
        let limit = array.count
        let offset = self.pokemonList.count
        for i in (offset..<offset + limit) {
            let index = i - offset
            newArray.append(.init(index: i,
                                  model: array[index]))
        }
        newArray = sortCriteria.sortingMethod(newArray)
        return newArray
    }
}
