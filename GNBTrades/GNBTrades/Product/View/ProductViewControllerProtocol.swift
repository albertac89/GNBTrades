//
//  ProductViewControllerProtocol.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 18/09/2021.
//

import Foundation

protocol ProductViewControllerProtocol: class {
    func configureNavBar(title: String)
    func setData(data: [Transaction])
    func configureSumWith(total: String, currency: String)
    func startActivityIndicator()
    func stopActivityIndicator()
}
