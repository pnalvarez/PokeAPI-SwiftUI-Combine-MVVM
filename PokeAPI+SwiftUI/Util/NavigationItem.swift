//
//  NavigationItem.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 30/08/22.
//
import SwiftUI

protocol NavigationItem: Hashable, Identifiable {
    associatedtype SomeView: View
    func nextView() -> SomeView

    var id: UUID { get }
}

extension NavigationItem {
    var id: UUID {
        UUID()
    }
}
