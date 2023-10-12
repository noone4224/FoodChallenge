//
//  RecipeResponseModel.swift
//  FoodChallenge
//
//  Created by Rafael on 10/10/23.
//

import Foundation

struct RecipeResponseModel: Codable {
    
    let name: String?
    let urlImage: String?
    let ingredients: [RecipeIngredients]?
    let location: LocationRecipe?
    let procedure: [String]?
}

struct RecipeIngredients: Codable, Hashable {
    let name: String?
    let measure: String?
}

struct LocationRecipe: Codable {
    
    let name: String?
    let address: String?
    let latitude: String?
    let longitude: String?
}
