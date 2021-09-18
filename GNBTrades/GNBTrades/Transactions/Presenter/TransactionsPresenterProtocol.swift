//
//  MainPresenterProtocol.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 18/09/2021.
//

import Foundation

protocol TransactionsPresenterProtocol {
    func getTransactionsForProductWith(sku: String) -> [Transaction] 
}
