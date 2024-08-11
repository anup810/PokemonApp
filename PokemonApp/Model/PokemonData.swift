//
//  PokemonData.swift
//  PokemonApp
//
//  Created by Anup Saud on 2024-08-10.
//

import Foundation

struct PokemonData:Codable,Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let weight: Int
    let height: Int
    let attack: Int
    let defense: Int
    let description: String
}
