//
//  RemoteDataSourceTests.swift
//  RemoteDataSourceTests
//
//  Created by Rafael on 10/10/23.
//

import XCTest

@testable import FoodChallenge

final class RemoteDataSourceTests: XCTestCase {

    func testGetFoods() {
        let expectation = XCTestExpectation(description: "Fetch Foods")

        FoodManager.shared.getFoods { result in
            switch result {
            case .success(let foodResponse):
                XCTAssertNotNil(foodResponse)
                XCTAssertGreaterThan(foodResponse.foods.count, 1)
            case .failure(let error):
                XCTFail("Failed to fetch foods with error: \(error.localizedDescription)")
            }

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }
    
    func testGetRecipe() {
        let expectation = XCTestExpectation(description: "Fetch Recipe")

        RecipeManager.shared.getRecipe(id: 1) { result in
            switch result {
            case .success(let recipe):
                XCTAssertNotNil(recipe)
                XCTAssertEqual(recipe.name, "Pasta")
            case .failure(let error):
                XCTFail("Failed to fetch recipe with error: \(error.localizedDescription)")
            }

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }
}
