//
//  ProductServiceProtocol.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 18/09/2021.
//

import Foundation

protocol ProductServiceProtocol {
    func getRates(completion: @escaping (Result<[Rate], Error>) -> Void)
}
