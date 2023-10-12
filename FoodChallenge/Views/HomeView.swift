//
//  HomeView.swift
//  FoodChallenge
//
//  Created by Rafael on 10/10/23.
//

import SwiftUI
import Foundation



public struct HomeView: View {
    
    @State private var foods: [Food?] = []
    @State private var searchText = ""
    private let getFoodsUseCase = GetFoodsUseCase() 
    
    public var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding()
                
                List {
                    ForEach(filteredFoods.compactMap { $0 }, id: \.self) { food in
                        HStack {
                            AsyncImage(url: URL(string: food?.urlImage ?? ""), scale: 3)
                                .frame(width: 50, height: 50)
                            
                            NavigationLink(destination: RecipeView(id: food?.id ?? 0)) {
                                Text(food?.name ?? "Unknown Food")
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .padding(0)
                .onAppear {
                    getFoodsUseCase.fetchData { foodResponse in
                        self.foods = foodResponse?.foods ?? []
                    }
                }
                .navigationTitle("Foods")
            }
            .background(Color.white)
        }
    }
    
    var filteredFoods: [Food?] {
        if searchText.isEmpty {
            return foods
        } else {
            return foods.filter { food in
                (food?.name?.contains(searchText) ?? false) ||
                (food?.ingredients.contains { $0?.contains(searchText) ?? false } ?? false)
            }
        }
    }
}

#Preview {
    HomeView()
}
