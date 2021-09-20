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
    
    init(service: ProductServiceProtocol, transactions: [Transaction]) {
        self.service = service
        self.transactions = transactions
    }
    
    private func getRates() {
        service.getRates { (result: Result<[Rate], Error>) in
            switch result {
            case .success(let rates):
                self.rates = rates
                self.sumTransactionsWith(currency: "EUR")
            case .failure(let error):
                self.view?.stopActivityIndicator()
                print(error)
            }
        }
    }
    
    private func sumTransactionsWith(currency: String) {
        var sum: Float = 0.0
        var count = 0
        
        for transaction in transactions {
            guard let safeRates = rates else { break }
            if transaction.currency == currency {
                sum += transaction.amount.floatValue
                count += 1
                continue
            }
            let result = safeRates.first(where: { $0.from == transaction.currency && $0.to == currency })
            if let resultRate = result {
                sum += transaction.amount.floatValue * resultRate.rate.floatValue
                count += 1
                continue
            } else {
                for rate in safeRates {
                    let result = safeRates.first(where: { $0.from == rate.to && $0.to == currency })
                    guard let resultRate = result, rate.from == transaction.currency else { continue }
                    sum += (transaction.amount.floatValue * resultRate.rate.floatValue) * rate.rate.floatValue
                    rates?.append(Rate(from: transaction.currency,
                                       to: currency,
                                       rate: String(resultRate.rate.floatValue * rate.rate.floatValue)))
                    count += 1
                    break
                }
            }
        }
        
        print(" SUM: \(sum) \n TRANSACTIONS COUNT: \(transactions.count) \n SUM COUNT: \(count)")
        view?.configureSumWith(total: String(sum), currency: currency)
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
