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
            Picker("Sorting criteria", selection: $viewModel.sortCriteria) {
                ForEach(PokemonListSortCriteria.allCases,
                        id: \.self) { item in
                    Text(item.rawValue)
                }
            }
            .pickerStyle(.segmented)
            List {
                VStack {
                    ForEach(viewModel.pokemonList.indexed(), id: \.index) { item in
                        PokemonListItemView(index: "\(item.element.index)",
                                            name: item.element.model.name)
                        .onTapGesture {
                            viewModel.didSelectItem(item.index)
                        }
                    }
                    ProgressView()
                        .onAppear(perform: viewModel.onAppear)
                }
                .listRowBackground(Color.blue)
            }
        }
        .navigationTitle(viewModel.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView(viewModel: PokemonListViewModel())
            .previewDevice("iPhone 13 Pro Max")
    }
}
