//
//  ProductsListViewControllerMock.swift
//  GNBTradesTests
//
//  Created by Aige Cortasa, Albert on 21/09/2021.
//

import Foundation
@testable import GNBTrades

class ProductsListViewControllerMock: ProductsListViewControllerProtocol {
    var setDataIsCalled = false
    var showMessageIsCalled = false
    var startActivityIndicatorIsCalled = false
    var stopActivityIndicatorIsCalled = false
    
    func setData(products: [String]) {
        setDataIsCalled = true
    }
    
    func showMessage(title: String, message: String) {
        showMessageIsCalled = true
    }
    
    func startActivityIndicator() {
        startActivityIndicatorIsCalled = true
    }
    
    func stopActivityIndicator() {
        stopActivityIndicatorIsCalled = true
    }
}
