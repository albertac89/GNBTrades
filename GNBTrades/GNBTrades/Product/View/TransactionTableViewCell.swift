//
//  TransactionTableViewCell.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 20/09/2021.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    static let identifier = String(describing: TransactionTableViewCell.self)
    @IBOutlet weak var skuLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var separator: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(model: Transaction) {
        skuLabel.text = "SKU: \(model.sku)"
        skuLabel.font = .boldSystemFont(ofSize: 18)
        amountLabel.text = model.amount
        amountLabel.font = .boldSystemFont(ofSize: 18)
        currencyLabel.text = model.currency
        currencyLabel.font = .boldSystemFont(ofSize: 18)
        separator.backgroundColor = .systemBlue
    }
}
