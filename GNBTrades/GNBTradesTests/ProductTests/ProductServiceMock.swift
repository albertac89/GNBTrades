//
//  ProductServiceMock.swift
//  GNBTradesTests
//
//  Created by Aige Cortasa, Albert on 21/09/2021.
//

import Foundation
@testable import GNBTrades

class ProductServiceMock: ProductServiceProtocol {
    var getRatesIsCalled = false
    
    func getRates(completion: @escaping (Result<[Rate], Error>) -> Void) {
        getRatesIsCalled = true
        completion(.success(Mock.rates()))
    }
}
