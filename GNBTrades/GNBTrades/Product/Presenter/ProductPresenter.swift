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
    var rates: [Rate]?
    var currency = "EUR"
    
    init(service: ProductServiceProtocol, transactions: [Transaction]) {
        self.service = service
        self.transactions = transactions
    }
    
    private func getRates() {
        service.getRates { [weak self] (result: Result<[Rate], Error>) in
            switch result {
            case .success(let rates):
                self?.rates = rates
                if let transactionsSum = self?.sumTransactionsWith(currency: self?.currency ?? "") {
                    self?.view?.configureSumWith(total: transactionsSum, currency: self?.currency ?? "")
                }
            case .failure(let error):
                self?.view?.showMessage(title: "Error", message: error.localizedDescription)
            }
        }
    }
    
    func sumTransactionsWith(currency: String) -> String {
        var sum: Double = 0.0
        
        for transaction in transactions {
            if transaction.currency == currency {
                sum += transaction.amount.doubleValue.bankersRounding
                continue
            } else if let safeRates = rates,
                      let resultRate = safeRates.first(where: { $0.from == transaction.currency && $0.to == currency }) {
                sum += (transaction.amount.doubleValue * resultRate.rate.doubleValue).bankersRounding
                continue
            } else if let safeRates = rates {
                for rate in safeRates {
                    let result = safeRates.first(where: { $0.from == rate.to && $0.to == currency })
                    guard let resultRate = result, rate.from == transaction.currency else { continue }
                    sum += ((transaction.amount.doubleValue * resultRate.rate.doubleValue) * rate.rate.doubleValue).bankersRounding
                    rates?.append(Rate(from: transaction.currency,
                                       to: currency,
                                       rate: String(resultRate.rate.doubleValue * rate.rate.doubleValue)))
                    break
                }
            }
        }

        return String(sum.bankersRounding)
    }
}

extension ProductPresenter: ProductPresenterProtocol {
    func viewDidLoad() {
        getRates()
        guard let sku = transactions.first?.sku else { return }
        view?.configureNavBar(title: "Product \(sku)")
        view?.setData(data: self.transactions)
    }
}
