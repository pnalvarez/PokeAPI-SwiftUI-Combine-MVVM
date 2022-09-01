//
//  PokemonListViewModel.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 20/08/22.
//

import Combine

protocol PokemonListViewModelProtocol: ObservableObject {
    var pokemonList: [PokemonListDetailsModel] { get set }
    var sortCriteria: PokemonListSortCriteria { get set }
    var listIsFull: Bool { get }
    var title: String { get }
    var isLoading: Bool { get }
    
    func onAppear()
    func itemDidAppear(_ index: Int)
    func didSelectItem(_ index: Int)
}

final class PokemonListViewModel {
    // - MARK: Published properties
    @Published var pokemonList: [PokemonListDetailsModel] = []
    @Published var sortCriteria: PokemonListSortCriteria = .numerical
    
    // - MARK: State properties
    var listIsFull: Bool = false
    var isLoading: Bool = true
    let title: String = "Pokemon List"
    
    // - MARK: Layer properties
    private let service: PokemonListServiceProtocol
    private let coordinator: PokemonListCoordinatorViewModelProtocol
    
    // - MARK: Logical properties
    private var currentIndex: Int = 0
    private let pageSize: Int = 20
    
    // - MARK: Combine cancellables
    private var cancellables = Set<AnyCancellable>()
    
    // - MARK: Initializer
    init(service: PokemonListServiceProtocol = PokemonListService(),
         coordinator: PokemonListCoordinatorViewModelProtocol = PokemonListCoordinatorViewModel()) {
        self.service = service
        self.coordinator = coordinator
        $sortCriteria.sink(receiveValue: {
            self.pokemonList = $0.sortingMethod(self.pokemonList)
        })
        .store(in: &cancellables)
    }
    
    // - MARK: Private methods
    
    private func mapToDataViewModel(_ array: [PokemonListItemModel]) -> [PokemonListItemDataViewModel] {
        var newArray = [PokemonListItemDataViewModel]()
        let limit = array.count
        let offset = self.pokemonList.count
        for i in (offset..<offset + limit) {
            let index = i - offset
            newArray.append(.init(index: i,
                                  model: array[index]))
        }
        return newArray
    }
    
    private func fetchPokemonList(completion: @escaping () -> Void = { }) {
       service.fetchPokemonList(offset: currentIndex, limit: pageSize)
            .replaceError(with: [])
            .map(mapToDataViewModel)
            .uncollect({ $0 })
            .flatMap({ self.service.fetchPokemonDetails(id: "\($0.id)")
                    .replaceError(with: .init(id: 0, name: "", image: ""))
            })
            .sink(receiveValue: { value in
                self.pokemonList.append(value)
                self.pokemonList.sort(by: self.sortCriteria.comparisonMethod)
                completion()
            })
            .store(in: &cancellables)
    }
}

// - MARK: Input methods
extension PokemonListViewModel: PokemonListViewModelProtocol {
    func onAppear() {
        fetchPokemonList {
            self.isLoading = false
            self.currentIndex += self.pageSize - 1
        }
    }
    
    func itemDidAppear(_ index: Int) {
        guard index >= currentIndex - 1 else { return }
        currentIndex += pageSize
        fetchPokemonList()
    }
    
    func didSelectItem(_ index: Int) {
        coordinator.navigateToPokemonDetails(pokemonList[index])
    }
}







