//
//  RecipeView.swift
//  FoodChallenge
//
//  Created by Rafael on 11/10/23.
//

import Foundation
import SwiftUI

struct RecipeView: View {
    let id: Int

    @State private var recipe: RecipeResponseModel? = nil
    private let getRecipeUseCase = GetRecipeUseCase()

    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(url: URL(string: recipe?.urlImage ?? ""), scale: 3)
                .scaledToFill()
                .frame(height: 200)
                .clipped()
            
            TabView {
                if let procedure = recipe?.procedure {
                    ProcedureTabView(procedure: procedure)
                        .tabItem {
                            Label("Procedure", systemImage: "list.bullet")
                        }
                }
                if let ingredients = recipe?.ingredients {
                    IngredientsTabView(ingredients: ingredients)
                        .tabItem {
                            Label("Ingredients", systemImage: "square.and.pencil")
                        }
                }
                if let location = recipe?.location {
                    MapTabView(location: location)
                        .tabItem {
                            Label("Location", systemImage: "mappin")
                        }
                }
            }
        }
        .onAppear {
            getRecipeUseCase.fetchData(id: id) { recipe in
                self.recipe = recipe
            }
        }
    }
}

#Preview {
    RecipeView(id: 1)
}
