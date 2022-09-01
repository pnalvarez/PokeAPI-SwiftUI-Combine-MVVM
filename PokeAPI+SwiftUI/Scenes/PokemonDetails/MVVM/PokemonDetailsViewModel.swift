//
//  PokemonDetailsViewModel.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 29/08/22.
//
import SwiftUI
import Combine

protocol PokemonDetailsViewModelProtocol: ObservableObject {
    var name: String { get }
    var baseExperience: String { get }
    var height: String { get }
    var weight: String { get }
    var types: String { get }
    var image: URL? { get }
    var defaultImage: String { get }
    var hasError: Bool { get }
    var errorTitle: String { get }
    var errorMessage: String { get }
    var isLoading: Bool { get }
    func onAppear()
    func getBackgroundGradient() -> LinearGradient
}

final class PokemonDetailsViewModel: PokemonDetailsViewModelProtocol {
    private enum Strings {
        static let errorTitle = "An error occurred"
        static let defaultErrorMessage = "Generic error"
        static let nameFormat = "Name: %@"
        static let baseExperienceFormat = "Base experience: %d"
        static let heightFormat = "Height: %d"
        static let weightFormat = "Weight: %d"
        static let typesFormat = "Types: %@"
        static let defaultImage = "pokeball_default"
    }
    
    private let id: String
    private let service: PokemonDetailsServiceProtocol
    private let coordinator: PokemonDetailsCoordinatorProtocol
    
    @Published private var model: PokemonDetailsModel?
    
    @Published var name: String = String(format: Strings.nameFormat, "")
    @Published var baseExperience: String = String(format: Strings.baseExperienceFormat, "")
    @Published var height: String = String(format: Strings.heightFormat, "")
    @Published var weight: String = String(format: Strings.weightFormat, "")
    @Published var types: String = String(format: Strings.typesFormat, "")
    @Published var image: URL?
    var defaultImage: String = Strings.defaultImage
    
    var hasError: Bool = false
    var isLoading: Bool = true
    var errorTitle: String = Strings.errorTitle
    var errorMessage: String = Strings.defaultErrorMessage
    
    private var subscription: AnyCancellable?
    
    init(id: String,
         service: PokemonDetailsServiceProtocol = PokemonDetailsService(),
         coordinator: PokemonDetailsCoordinatorProtocol = PokemonDetailsCoordinatorViewModel()) {
        self.id = String(id.split(separator: "/").last ?? "")
        self.service = service
        self.coordinator = coordinator
        initializeSubscriptions()
    }
    
    func onAppear() {
        hasError = false
        subscription = service
            .fetchDetails(id: id)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case let .failure(error):
                    self.errorMessage = error.localizedDescription
                    self.hasError = true
                case .finished:
                    break
                }
            }, receiveValue: { value in
                self.model = value
            })
    }
    
    private func initializeSubscriptions() {
        $model
            .map(\.?.name)
            .replaceNil(with: String(format: Strings.nameFormat))
            .map({ String(format: Strings.nameFormat, $0) })
            .assign(to: &$name)
        $model
            .map(\.?.baseExperience)
            .replaceNil(with: 0)
            .map({ String(format: Strings.baseExperienceFormat, $0) })
            .assign(to: &$baseExperience)
        $model
            .map(\.?.height)
            .replaceNil(with: 0)
            .map({ String(format: Strings.heightFormat, $0) })
            .assign(to: &$height)
        $model
            .map(\.?.weight)
            .replaceNil(with: 0)
            .map({ String(format: Strings.weightFormat, $0) })
            .assign(to: &$weight)
        $model
            .map(\.?.types)
            .replaceNil(with: [])
            .map({ String(format: Strings.typesFormat, $0.joined(separator: ",")) })
            .assign(to: &$types)
        $model
            .map(\.?.image)
            .replaceNil(with: "")
            .map({ URL(string: $0) })
            .assign(to: &$image)
    }
    
    func getBackgroundGradient() -> LinearGradient {
        LinearGradient(colors: model?.types.map({ PokemonTypeUIModel(rawValue: $0)?.color ?? Color.white }) ?? [], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
