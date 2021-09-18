//
//  ProductBuilder.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 18/09/2021.
//

import Foundation
import UIKit

class ProductBuilder {
    static func build(transactions: [Transaction]) -> UIViewController {
        let apiClient = APIClient()
        let service = ProductService(apiClient: apiClient)
        let presenter = ProductPresenter(service: service, transactions: transactions)
        let view = ProductViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}
