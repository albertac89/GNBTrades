//
//  ProductService.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 18/09/2021.
//

import Foundation

class ProductService {
    var apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
}

extension ProductService: ProductServiceProtocol {
    func getRates(completion: @escaping (Result<[Rate], Error>) -> Void) {
        apiClient.fetch(with: .get, path: "rates.json") { (result: Result<[Rate], Error>) in
            completion(result)
        }
    }
}
