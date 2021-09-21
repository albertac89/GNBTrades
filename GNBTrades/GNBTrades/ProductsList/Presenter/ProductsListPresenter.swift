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
    private var transactions: [Transaction]?
    
    init(service: ProductsListServiceProtocol) {
        self.service = service
    }
    
    private func loadProducts() {
        view?.startActivityIndicator()
        service.getTransactionsList { [weak self] (result: Result<[Transaction], Error>) in
            switch result {
            case .success(let transactions):
                self?.view?.stopActivityIndicator()
                self?.transactions = transactions
                guard let products = self?.grupTransactionsInProducts(transactions: transactions) else {
                    self?.view?.showMessage(title: "Error", message: "Something went wrong gruping the transactions into products")
                    return
                }
                self?.view?.setData(products: products)
            case .failure(let error):
                self?.view?.stopActivityIndicator()
                self?.view?.showMessage(title: "Error", message: error.localizedDescription)
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
}

extension ProductsListPresenter: ProductsListPresenterProtocol {
    func viewDidLoad() {
        loadProducts()
    }
    
    func getTransactionsForProductWith(sku: String) -> [Transaction]? {
        guard let safeTransactions = self.transactions else { return nil }
        return safeTransactions.filter({ $0.sku == sku })
    }
}
