//
//  RecipesAPI.swift
//  FoodChallenge
//
//  Created by Rafael on 10/10/23.
//

import Foundation

class FoodManager {
    static let shared = FoodManager()

    private init() {}

    private let networkManager = NetworkManager.shared

    func getFoods(completion: @escaping NetworkManager.CompletionHandler<FoodsResponseModel>) {
        networkManager.makeRequest(endpoint: .getFoods, responseType: FoodsResponseModel.self, completion: completion)
    }
}

class RecipeManager {
    static let shared = RecipeManager()

    private init() {}

    private let networkManager = NetworkManager.shared

    func getRecipe(id: Int, completion: @escaping NetworkManager.CompletionHandler<RecipeResponseModel>) {
        let endpoint = Endpoints.Endpoint.getRecipe.rawValue + "?id=\(id)"
        networkManager.makeRequest(endpoint: Endpoints.Endpoint(rawValue: endpoint) ?? .getRecipe, responseType: RecipeResponseModel.self, completion: completion)
    }
}


struct APIConstants {
    static let baseURL = "http://demo5047648.mockable.io/"
}

struct Endpoints {
    enum Endpoint: String {
        case getFoods = "GetFoods"
        case getRecipe = "GetRecipe"
    }
}
