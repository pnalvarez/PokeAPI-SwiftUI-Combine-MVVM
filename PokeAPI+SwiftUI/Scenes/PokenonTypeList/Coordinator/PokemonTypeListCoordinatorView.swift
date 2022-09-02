//
//  PokemonTypeListCoordinatorView.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 01/09/22.
//

import SwiftUI

struct PokemonTypeListCoordinatorView<CoordinatorViewModel: PokemonTypeListCoordinatorViewModelProtocol, LogicViewModel: PokemonTypesListViewModelProtocol>: View {
    @ObservedObject var viewModel: CoordinatorViewModel
    let content: PokemonTypesListView<LogicViewModel>
    
    var body: some View {
        NavigationView {
            ZStack {
                content
                    .navigationTitle(viewModel.title)
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct PokemonTypeListCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonTypeListSceneFactory.build()
    }
}
