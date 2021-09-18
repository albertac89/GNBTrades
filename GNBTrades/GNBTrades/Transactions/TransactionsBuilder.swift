//
//  MainBuilder.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 18/09/2021.
//

import Foundation
import UIKit

class TransactionsBuilder {
    static func build() -> UIViewController {
        let apiClient = APIClient()
        let service = TransactionsService(apiClient: apiClient)
        let presenter = TransactionsPresenter(service: service)
        let view = TransactionsViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}
