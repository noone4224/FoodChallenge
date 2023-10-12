//
//  GetRecipesUseCase.swift
//  FoodChallenge
//
//  Created by Rafael on 12/10/23.
//

import Foundation

struct GetRecipeUseCase {
    
    func fetchData(id: Int, completion: @escaping (RecipeResponseModel?) -> Void) {
        RecipeManager.shared.getRecipe(id: id) { result in
            switch result {
            case .success(let recipe):
                completion(recipe)
            case .failure(let error):
                print("Failed to fetch recipe with error: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
}
