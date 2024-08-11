//
//  PokemonGridView.swift
//  PokemonApp
//
//  Created by Anup Saud on 2024-08-10.
//

import SwiftUI

struct PokemonGridView: View {
    private let gridItems = [GridItem(.flexible()),GridItem(.flexible())]
    
    @ObservedObject var viewModel = PokemonViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.2), Color.pink.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                ScrollView{
                    LazyVGrid(columns: gridItems,spacing: 16){
                        ForEach(viewModel.pokemonData){ pokemon in
                            NavigationLink {
                                PokemonDetailView(viewModel: viewModel, pokemon: pokemon)
                            } label: {
                                PokeCell(pokemon: pokemon, viewModel: viewModel)
                            }

                            
                        }
                    }
                }.navigationTitle("Pokemonn Club")            }
        }
    }
}

#Preview {
    PokemonGridView()
}
