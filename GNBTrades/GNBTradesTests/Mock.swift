//
//  Mock.swift
//  GNBTradesTests
//
//  Created by Aige Cortasa, Albert on 21/09/2021.
//

import Foundation

struct Mock {
    static let currency = "EUR"
    static let sku = "Y3942"
    static let resultSumTransactions = "162.18"
    
    static func transactions() -> [Transaction] {
        let transactionsJson = """
            [{"sku":"Y3942","amount":"18.6","currency":"USD"},{"sku":"P5757","amount":"28.7","currency":"CAD"},{"sku":"O5430","amount":"28.5","currency":"AUD"},{"sku":"Y3942","amount":"31.0","currency":"USD"},{"sku":"A3064","amount":"24.3","currency":"USD"},{"sku":"X2804","amount":"24.9","currency":"EUR"},{"sku":"H8647","amount":"20.2","currency":"USD"},{"sku":"X2804","amount":"22.7","currency":"USD"},{"sku":"A1511","amount":"23.1","currency":"CAD"},{"sku":"A1511","amount":"17.5","currency":"USD"},{"sku":"Y2882","amount":"29.9","currency":"EUR"},{"sku":"Y3942","amount":"22.4","currency":"CAD"},{"sku":"L3680","amount":"26.1","currency":"USD"},{"sku":"A3064","amount":"29.1","currency":"USD"},{"sku":"Y3942","amount":"25.7","currency":"EUR"},{"sku":"T0815","amount":"20.1","currency":"USD"},{"sku":"L1809","amount":"23.3","currency":"CAD"},{"sku":"Y3942","amount":"28.4","currency":"USD"},{"sku":"Y3942","amount":"20.6","currency":"AUD"},{"sku":"X2804","amount":"27.2","currency":"CAD"},{"sku":"A1511","amount":"34.6","currency":"EUR"}]
        """.data(using: String.Encoding.utf8)!
        
        let decoder = JSONDecoder()
        do {
            let listObjetcArray = try decoder.decode([Transaction].self, from: transactionsJson)
            return listObjetcArray
        } catch {
            return []
        }
    }
    
    static func transactionsForProduct() -> [Transaction] {
        let transactionsJson = """
            [{"sku":"Y3942","amount":"18.6","currency":"USD"},{"sku":"Y3942","amount":"31.0","currency":"USD"},{"sku":"Y3942","amount":"22.4","currency":"CAD"},{"sku":"Y3942","amount":"25.7","currency":"EUR"},{"sku":"Y3942","amount":"28.4","currency":"USD"},{"sku":"Y3942","amount":"20.6","currency":"AUD"}]
        """.data(using: String.Encoding.utf8)!
        
        let decoder = JSONDecoder()
        do {
            let listObjetcArray = try decoder.decode([Transaction].self, from: transactionsJson)
            return listObjetcArray
        } catch {
            return []
        }
    }
    
    static func rates() -> [Rate] {
        let ratesJson = """
            [{"from":"CAD","to":"EUR","rate":"0.51"},{"from":"EUR","to":"CAD","rate":"1.96"},{"from":"CAD","to":"AUD","rate":"1.01"},{"from":"AUD","to":"CAD","rate":"0.99"},{"from":"EUR","to":"USD","rate":"0.68"},{"from":"USD","to":"EUR","rate":"1.47"}]
        """.data(using: String.Encoding.utf8)!
        
        let decoder = JSONDecoder()
        do {
            let listObjetcArray = try decoder.decode([Rate].self, from: ratesJson)
            return listObjetcArray
        } catch {
            return []
        }
    }
}
