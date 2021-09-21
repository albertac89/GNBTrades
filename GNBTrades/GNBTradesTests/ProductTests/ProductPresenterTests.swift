//
//  ProductPresenterTests.swift
//  GNBTradesTests
//
//  Created by Aige Cortasa, Albert on 21/09/2021.
//

import Foundation
import XCTest
@testable import GNBTrades

class ProductPresenterTests: XCTestCase {
    var sut: ProductPresenter!
    var view: ProductViewControllerMock!
    var service: ProductServiceMock!
    
    override func setUp() {
        super.setUp()
        view = ProductViewControllerMock()
        service = ProductServiceMock()
        sut = ProductPresenter(service: service, transactions: Mock.transactionsForProduct())
        sut.view = view
    }
    
    func testViewDidLoad() {
        XCTAssertFalse(service.getRatesIsCalled)
        XCTAssertFalse(view.configureNavBarIsCalled)
        XCTAssertFalse(view.setDataIsCalled)
        XCTAssertFalse(view.showMessageIsCalled)
        XCTAssertFalse(view.configureSumWithIsCalled)
        sut.viewDidLoad()
        XCTAssertTrue(service.getRatesIsCalled)
        XCTAssertTrue(view.configureNavBarIsCalled)
        XCTAssertTrue(view.setDataIsCalled)
        XCTAssertFalse(view.showMessageIsCalled)
        XCTAssertTrue(view.configureSumWithIsCalled)
    }
    
    func testsumTransactionsWith() {
        sut.viewDidLoad()
        let result = sut.sumTransactionsWith(currency: Mock.currency)
        XCTAssertEqual(result, Mock.resultSumTransactions)
    }
}
