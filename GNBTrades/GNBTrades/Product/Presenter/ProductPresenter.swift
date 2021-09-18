//
//  ProductPresenter.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 18/09/2021.
//

import Foundation

class ProductPresenter {
    weak var view: ProductViewControllerProtocol?
    var service: ProductServiceProtocol
    var transactions: [Transaction]
    
    init(service: ProductServiceProtocol, transactions: [Transaction]) {
        self.service = service
        self.transactions = transactions
    }
}

extension ProductPresenter: ProductPresenterProtocol {
    
}
