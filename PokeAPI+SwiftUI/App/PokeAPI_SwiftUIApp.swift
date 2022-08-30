//
//  PokeAPI_SwiftUIApp.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 18/08/22.
//

import SwiftUI

@main
struct PokeAPI_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            PokemonListFactory.build()
        }
    }
}
