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
        let service = TransactionsService()
        let presenter = TransactionsPresenter(service: service)
        let view = TransactionsViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}
