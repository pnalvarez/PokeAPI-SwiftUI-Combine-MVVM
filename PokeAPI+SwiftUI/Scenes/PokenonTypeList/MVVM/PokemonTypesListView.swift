//
//  PokemonTypesListView.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 02/09/22.
//

import SwiftUI

struct PokemonTypesListView<ViewModel: PokemonTypesListViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        List(viewModel.types, id: \.self) { type in
            PokemonTypeListItemView(name: type)
                .padding()
        }
        .onAppear(perform: viewModel.onAppear)
    }
}

struct PokemonTypesListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonTypeListFactory.build()
    }
}
