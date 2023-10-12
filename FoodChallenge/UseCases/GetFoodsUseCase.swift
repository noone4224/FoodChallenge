//
//  GetFoodsUseCase.swift
//  FoodChallenge
//
//  Created by Rafael on 12/10/23.
//

import Foundation

struct GetFoodsUseCase {
    
    func fetchData(completion: @escaping (FoodsResponseModel?) -> Void) {
        FoodManager.shared.getFoods { result in
            switch result {
            case .success(let foodResponse):
                completion(foodResponse)
            case .failure(let error):
                print("Failed to fetch foods with error: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
}
