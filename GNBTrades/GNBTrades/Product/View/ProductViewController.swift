//
//  ProductViewController.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 18/09/2021.
//

import UIKit

class ProductViewController: UIViewController {
    var presenter: ProductPresenterProtocol
    
    init(presenter: ProductPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ProductViewController: ProductViewControllerProtocol {
    
}
