//
//  ProductTableViewCell.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 19/09/2021.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    static let identifier = String(describing: ProductTableViewCell.self)
    @IBOutlet weak var productSkuLabel: UILabel!
    @IBOutlet weak var separator: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(sku: String) {
        productSkuLabel.text = "SKU: \(sku)"
        productSkuLabel.font = .boldSystemFont(ofSize: 18)
        separator.backgroundColor = .systemBlue
    }
}
