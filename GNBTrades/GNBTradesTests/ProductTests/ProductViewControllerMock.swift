//
//  ProductViewControllerMock.swift
//  GNBTradesTests
//
//  Created by Aige Cortasa, Albert on 21/09/2021.
//

import Foundation
@testable import GNBTrades

class ProductViewControllerMock: ProductViewControllerProtocol {
    var configureNavBarIsCalled = false
    var setDataIsCalled = false
    var configureSumWithIsCalled = false
    var showMessageIsCalled = false
    
    func configureNavBar(title: String) {
        configureNavBarIsCalled = true
    }
    
    func setData(data: [Transaction]) {
        setDataIsCalled = true
    }
    
    func configureSumWith(total: String, currency: String) {
        configureSumWithIsCalled = true
    }
    
    func showMessage(title: String, message: String) {
        showMessageIsCalled = true
    }
}
