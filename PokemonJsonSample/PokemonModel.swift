//
//  PokemonModel.swift
//  PokemonJsonSample
//
//  Created by 橋元雄太郎 on 2023/05/26.
//

import Foundation

struct PokemonResponse: Codable {
    let pokemon: [Pokemon]
}

struct Pokemon: Codable, Hashable {
    let id: Int
    let name: String
    let types: [String]
    let description: String
    let imageUrl: URL

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case types
        case description
        case imageUrl = "image_url"
    }
}
