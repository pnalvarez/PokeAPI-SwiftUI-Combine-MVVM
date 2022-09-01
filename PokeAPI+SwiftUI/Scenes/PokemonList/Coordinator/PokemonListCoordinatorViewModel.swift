//
//  PokemonListCoordinatorViewModel.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 22/08/22.
//
import Combine
import SwiftUI

enum PokemonListNavigationLinkItem: NavigationItem {
    case pokemonDetails(_ id: String)
    
    @ViewBuilder
    func nextView() -> some View {
        switch self {
        case let .pokemonDetails(id):
            PokemonDetailsSceneFactory.build(id: id)
        }
    }
}

protocol PokemonListCoordinatorViewModelProtocol {
    func navigateToPokemonDetails(_ model: PokemonListDetailsModel)
}

protocol PokemonListCoordinatorViewModelInput: ObservableObject {
    var navigationItem: PokemonListNavigationLinkItem? { get set }
    var navigationItemLinkCases: [PokemonListNavigationLinkItem] { get set }
    var title: String { get }
}

final class PokemonListCoordinatorViewModel: PokemonListCoordinatorViewModelInput, ObservableObject {
    @Published var navigationItem: PokemonListNavigationLinkItem?
    var navigationItemLinkCases: [PokemonListNavigationLinkItem] = []
    let title: String = "Pokemon List"
    
    private var subscription: AnyCancellable?
    
    init() {
        subscription = $navigationItem.sink(receiveValue: { item in
            guard let item = item else { return }
            self.navigationItemLinkCases.append(item)
        })
    }
}

extension PokemonListCoordinatorViewModel: PokemonListCoordinatorViewModelProtocol {
    func navigateToPokemonDetails(_ model: PokemonListDetailsModel) {
        navigationItem = .pokemonDetails("\(model.id)")
    }
}
