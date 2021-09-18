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
    
}
