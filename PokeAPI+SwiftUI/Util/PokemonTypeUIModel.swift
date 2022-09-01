//
//  PokemonType.swift
//  PokeAPI+SwiftUI
//
//  Created by Pedro Alvarez on 01/09/22.
//
import SwiftUI

enum PokemonTypeUIModel: String, CaseIterable {
    case water
    case grass
    case fire
    case electric
    case bug
    case normal
    case psychic
    case shadow
    case ghost
    case fairy
    case unknown
    case steel
    case ground
    case rock
    case ice
    case poison
    case flying
    case fighting
    case dark
    case dragon

    var color: Color {
        switch self {
        case .water:
            return .blue
        case .grass:
            return .green
        case .fire:
            return .orange
        case .electric:
            return .yellow
        case .bug:
            return Color(hex: 0x77773c)
        case .normal:
            return Color(hex: 0xb3b3b3)
        case .psychic:
            return Color(hex: 0x9900cc)
        case .shadow:
            return Color(hex: 0x4d0019)
        case .ghost:
            return Color(hex: 0x26004d)
        case .fairy:
            return Color(hex: 0xff33cc)
        case .unknown:
            return Color(hex: 0x000000)
        case .steel:
            return Color(hex: 0x99ccff)
        case .ground:
            return Color(hex: 0xd27979)
        case .rock:
            return Color(hex: 0x5c5c8a)
        case .ice:
            return Color(hex: 0x00ffff)
        case .poison:
            return Color(hex: 0x290066)
        case .flying:
            return Color(hex: 0x0088cc)
        case .fighting:
            return Color(hex: 0xffc34d)
        case .dark:
            return Color(hex: 0x008080)
        case .dragon:
            return Color(hex: 0x0000b3)
        }
    }
}
