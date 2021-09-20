//
//  ProductsListPresenterProtocol.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 18/09/2021.
//

import Foundation

protocol ProductsListPresenterProtocol {
    func viewDidLoad()
    func getTransactionsForProductWith(sku: String) -> [Transaction]?
}
