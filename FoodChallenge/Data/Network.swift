//
//  Network.swift
//  FoodChallenge
//
//  Created by Rafael on 10/10/23.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    typealias CompletionHandler<T> = (Result<T, Error>) -> Void
    
    // Function for making a generic request
    public func makeRequest<T: Codable>(endpoint: Endpoints.Endpoint, responseType: T.Type, completion: @escaping CompletionHandler<T>) {
        
        guard let url = URL(string: APIConstants.baseURL + endpoint.rawValue) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? NSError(domain: "Unknown error", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                if let sampleData = self.loadSampleData(for: endpoint) {
                    do {
                        let decodedResponse = try JSONDecoder().decode(T.self, from: sampleData)
                        completion(.success(decodedResponse))
                    } catch {
                        completion(.failure(error))
                    }
                }  else {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    private func loadSampleData(for endpoint: Endpoints.Endpoint) -> Data? {
        guard let path = Bundle.main.path(forResource: "\(endpoint.rawValue)", ofType: "json") else {
            return nil
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            return data
        } catch {
            print("Error loading sample data for \(endpoint.rawValue):", error)
            return nil
        }
    }
}
