//
//  IngredientsView.swift
//  FoodChallenge
//
//  Created by Rafael on 12/10/23.
//

import Foundation
import SwiftUI

struct IngredientsTabView: View {
    
    let ingredients: [RecipeIngredients?]
    
    var body: some View {
        List {
            ForEach(ingredients.compactMap { $0 }, id: \.self) { ingredient in
                HStack {
                    Text(ingredient.name ?? "Unknown Ingredient")
                    Spacer()
                    Text(ingredient.measure ?? "")
                }
            }
        }
        .listStyle(PlainListStyle())
    }
}
