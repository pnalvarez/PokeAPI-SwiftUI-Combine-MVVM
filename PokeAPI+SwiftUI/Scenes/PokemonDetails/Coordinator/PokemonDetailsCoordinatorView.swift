//
//  PokemonDetailsCoordinatorView.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 29/08/22.
//

import SwiftUI

struct PokemonDetailsCoordinatorView<CoordinatorViewModel: PokemonDetailsCoordinatorViewModelProtocol, LogicViewModel: PokemonDetailsViewModelProtocol>: View {
    @ObservedObject var viewModel: CoordinatorViewModel
    var content: PokemonDetailsView<LogicViewModel>
    
    var body: some View {
        NavigationView {
            ZStack {
                content
            }
        }
    }
}

struct PokemonDetailsCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsSceneFactory.build(id: "")
    }
}
