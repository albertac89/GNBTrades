//
//  ProductsListServiceProtocol.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 18/09/2021.
//

import Foundation

protocol ProductsListServiceProtocol {
    func getTransactionsList(completion: @escaping (Result<[Transaction], Error>) -> Void)
}
