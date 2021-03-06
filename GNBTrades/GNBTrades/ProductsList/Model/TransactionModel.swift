//
//  TransactionModel.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 18/09/2021.
//

import Foundation

struct Transaction: Codable, Equatable {
    let sku: String
    let amount: String
    let currency: String
}
