//
//  ProductsListPresenter.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 18/09/2021.
//

import Foundation

class ProductsListPresenter {
    weak var view: ProductsListViewControllerProtocol?
    var service: ProductsListServiceProtocol
    var transactions: [Transaction]?
    
    init(service: ProductsListServiceProtocol) {
        self.service = service
    }
}

extension ProductsListPresenter: ProductsListPresenterProtocol {
    func viewDidLoad() {
        loadProducts()
    }
    
    private func loadProducts() {
        view?.startActivityIndicator()
        service.getTransactionsList { (result: Result<[Transaction], Error>) in
            switch result {
            case .success(let transactions):
                self.transactions = transactions
                let products = self.grupTransactionsInProducts(transactions: transactions)
                self.view?.setData(products: products)
                self.view?.stopActivityIndicator()
            case .failure(let error):
                self.view?.stopActivityIndicator()
                print(error)
            }
        }
    }
    
    private func grupTransactionsInProducts(transactions: [Transaction]) -> [String] {
        var products = [String]()
        for transaction in transactions {
            if !products.contains(transaction.sku) {
                products.append(transaction.sku)
            }
        }
        return products
    }
    
    func getTransactionsForProductWith(sku: String) -> [Transaction]? {
        guard let safeTransactions = self.transactions else { return nil }
        return safeTransactions.filter({ $0.sku == sku })
    }
}
