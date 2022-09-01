//
//  PokemonListView.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 20/08/22.
//

import SwiftUI

struct PokemonListView<ViewModel: PokemonListViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                Picker("Sorting criteria", selection: $viewModel.sortCriteria) {
                    ForEach(PokemonListSortCriteria.allCases,
                            id: \.self) { item in
                        Text(item.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                List(viewModel.pokemonList.indexed(), id: \.index) { item in
                    PokemonListItemView(index: "\(item.element.id)",
                                        name: item.element.name,
                                        url: URL(string: item.element.image))
                    .onAppear(perform: { viewModel.itemDidAppear(item.index) })
                    .onTapGesture {
                        viewModel.didSelectItem(item.index)
                    }
                    .listStyle(.inset)
                }
            }
        }
        .navigationTitle(viewModel.title)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: viewModel.onAppear)
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView(viewModel: PokemonListViewModel())
            .previewDevice("iPhone 13 Pro Max")
    }
}
