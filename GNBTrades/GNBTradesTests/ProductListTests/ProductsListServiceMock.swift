//
//  ProductsListServiceMock.swift
//  GNBTradesTests
//
//  Created by Aige Cortasa, Albert on 21/09/2021.
//

import Foundation
@testable import GNBTrades

class ProductsListServiceMock: ProductsListServiceProtocol {
    var getTransactionsListIsCalled = false
    
    func getTransactionsList(completion: @escaping (Result<[Transaction], Error>) -> Void) {
        getTransactionsListIsCalled = true
        completion(.success(Mock.transactions()))
    }
}



