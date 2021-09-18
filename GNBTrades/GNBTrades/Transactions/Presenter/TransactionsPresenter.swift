//
//  MainPresenter.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 18/09/2021.
//

import Foundation

class TransactionsPresenter {
    weak var view: TransactionsViewControllerProtocol?
    var service: TransactionsServiceProtocol
    
    init(service: TransactionsServiceProtocol) {
        self.service = service
    }
}

extension TransactionsPresenter: TransactionsPresenterProtocol {
    func loadTransactions() {
        view?.setData(transactions: [Transaction]())
    }
    
    func getTransactionsForProductWith(sku: String) -> [Transaction] {
        return [Transaction]()
    }
}
