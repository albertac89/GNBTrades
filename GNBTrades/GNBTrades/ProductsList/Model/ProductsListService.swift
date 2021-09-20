//
//  ProductsListService.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 18/09/2021.
//

import Foundation

class ProductsListService {
    var apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
}

extension ProductsListService: ProductsListServiceProtocol {
    func getTransactionsList(completion: @escaping (Result<[Transaction], Error>) -> Void) {
        apiClient.fetch(with: .get, path: "transactions.json") { (result: Result<[Transaction], Error>) in
            completion(result)
        }
    }
}
