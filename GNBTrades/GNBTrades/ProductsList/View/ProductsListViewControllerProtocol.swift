//
//  ProductsListViewControllerProtocol.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 18/09/2021.
//

import Foundation

protocol ProductsListViewControllerProtocol: class {
    func setData(products: [String])
    func showMessage(title: String, message: String)
    func startActivityIndicator()
    func stopActivityIndicator()
}
