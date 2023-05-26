//
//  PokemonViewModel.swift
//  PokemonJsonSample
//
//  Created by 橋元雄太郎 on 2023/05/26.
//

import Foundation

class PokemonViewModel: ObservableObject {
    @Published var pokemon: [Pokemon] = []

    func fetchPokemon() {
        guard let url = Bundle.main.url(forResource: "pokemon", withExtension: "json") else {
            print("File not Found")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                if let decodedData = try? JSONDecoder().decode(PokemonResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.pokemon = decodedData.pokemon
                    }
                }
            }
        }
        task.resume()
    }
}
