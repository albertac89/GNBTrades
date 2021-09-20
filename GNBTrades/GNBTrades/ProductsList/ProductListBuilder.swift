//
//  ProductListBuilder.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 18/09/2021.
//

import Foundation
import UIKit

class ProductListBuilder {
    static func build() -> UIViewController {
        let apiClient = APIClient()
        let service = ProductsListService(apiClient: apiClient)
        let presenter = ProductsListPresenter(service: service)
        let view = ProductsListViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}
