//
//  PokemonDetailsView.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 22/08/22.
//

import SwiftUI

struct PokemonDetailsView<ViewModel: PokemonDetailsViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.hasError {
                VStack {
                    Text(viewModel.errorTitle)
                        .font(.title)
                        .bold()
                        .padding(.bottom, 24)
                    Text(viewModel.errorMessage)
                        .font(.title)
                }
            } else {
                VStack {
                    AsyncImage(url: viewModel.image, content: { image in
                        image
                            .resizable()
                            .scaledToFit()
                    }, placeholder: {
                        Image(viewModel.defaultImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                    })
                    Group {
                        Text(viewModel.name)
                        Text(viewModel.baseExperience)
                        Text(viewModel.height)
                        Text(viewModel.weight)
                        Text(viewModel.types)
                    }
                    .font(.system(.body))
                }
            }
        }
    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsFactory.build()
    }
}
