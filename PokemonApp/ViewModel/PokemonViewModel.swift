//
//  PokemonViewModel.swift
//  PokemonApp
//
//  Created by Anup Saud on 2024-08-10.
//

import Foundation
import SwiftUI

class PokemonViewModel: ObservableObject{
    @Published var pokemonData = [PokemonData]()
    let baseURL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init(){
        fetchData()
    }
    
    func fetchData(){
        guard let url = URL(string: baseURL) else {
            print("Fail to load Url")
            return
        }
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let  data = data?.parseData(removeString: "null,") else {return}
                
                
            guard let pokemon = try? JSONDecoder().decode([PokemonData].self, from: data) else {
                print("Fail to decode the data")
                return
            }
                DispatchQueue.main.async {
                    self.pokemonData = pokemon
                }
            }.resume()
    }
    func backgroundColor(forType type:String) ->UIColor{
        switch type{
        case "fire": return .orange
        case "poison": return .purple
        case "water": return .blue
        case "electric": return .yellow
        case "psychic": return .brown
        case "normal": return .magenta
        case "ground": return .green
        case "flying": return .cyan
        case "fairy": return .systemTeal
        default: return .systemPink
        }
    }
    
}
extension Data {
    func parseData(removeString string:String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        
        guard let data = parsedDataString?.data(using: .utf8) else {
            return nil
        }
        return data
        
    }
}
