//
//  PokemonListCoordinatorView.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 22/08/22.
//

import SwiftUI

struct PokemonListCoordinatorView<ViewModel: PokemonListCoordinatorViewModelInput>: View {
    @ObservedObject var viewModel: ViewModel
    let content: PokemonListView<PokemonListViewModel>
    
    var body: some View {
        NavigationView {
            ZStack {
                ForEach(viewModel.navigationItemLinkCases) { item in
                    NavigationLink(tag: item,
                                   selection: $viewModel.navigationItem,
                                   destination: item.nextView) { EmptyView() }
                }
                content
                    .navigationTitle(viewModel.title)
            }
        }
    }
}

struct PokemonListCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListCoordinatorView<PokemonListCoordinatorViewModel>(viewModel: PokemonListCoordinatorViewModel(), content: PokemonListView(viewModel: PokemonListViewModel()))
    }
}
