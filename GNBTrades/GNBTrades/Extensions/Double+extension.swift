//
//  Double+extension.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 21/09/2021.
//

import Foundation

extension Double {
    var bankersRounding: Double {
        let value = self * 100
        return value.rounded(.toNearestOrEven) / 100
    }
}
