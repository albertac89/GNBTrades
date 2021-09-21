//
//  ProductsListPresenterTests.swift
//  GNBTradesTests
//
//  Created by Aige Cortasa, Albert on 21/09/2021.
//

import Foundation
import XCTest
@testable import GNBTrades

class ProductsListPresenterTests: XCTestCase {
    var sut: ProductsListPresenter!
    var view: ProductsListViewControllerMock!
    var service: ProductsListServiceMock!
    
    override func setUp() {
        super.setUp()
        view = ProductsListViewControllerMock()
        service = ProductsListServiceMock()
        sut = ProductsListPresenter(service: service)
        sut.view = view
    }
    
    func testViewDidLoad() {
        XCTAssertFalse(view.startActivityIndicatorIsCalled)
        XCTAssertFalse(service.getTransactionsListIsCalled)
        XCTAssertFalse(view.stopActivityIndicatorIsCalled)
        XCTAssertFalse(view.showMessageIsCalled)
        XCTAssertFalse(view.setDataIsCalled)
        sut.viewDidLoad()
        XCTAssertTrue(view.startActivityIndicatorIsCalled)
        XCTAssertTrue(service.getTransactionsListIsCalled)
        XCTAssertTrue(view.stopActivityIndicatorIsCalled)
        XCTAssertFalse(view.showMessageIsCalled)
        XCTAssertTrue(view.setDataIsCalled)
    }
    
    func testgetTransactionsForProductWith() {
        sut.viewDidLoad()
        guard let result = sut.getTransactionsForProductWith(sku: Mock.sku) else {
            XCTFail("Expected non-nil result")
            return
        }
        XCTAssertEqual(result, Mock.transactionsForProduct())
    }
}
