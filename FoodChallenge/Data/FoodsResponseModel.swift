//
//  FoodsResponseModel.swift
//  FoodChallenge
//
//  Created by Rafael on 10/10/23.
//

import Foundation

struct FoodsResponseModel: Codable {
    let foods: [Food?]
}

struct Food: Codable, Hashable, Identifiable {
    let id: Int?
    let name: String?
    let ingredients: [String?]
    let urlImage: String?
    
    var uniqueID: Int {
        return id ?? 0
    }
}

