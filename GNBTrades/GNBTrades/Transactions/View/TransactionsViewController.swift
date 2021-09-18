//
//  TransactionsViewController.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 18/09/2021.
//

import UIKit

class TransactionsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var presenter: TransactionsPresenterProtocol
    private var data: [Transaction] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    init(presenter: TransactionsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "GNB"
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension TransactionsViewController: TransactionsViewControllerProtocol {
    func setData(transactions: [Transaction]) {
        self.data = transactions
    }
}

extension TransactionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let transactionsForProduct = presenter.getTransactionsForProductWith(sku: "")
        let productView = ProductBuilder.build(transactions: transactionsForProduct)
        self.navigationController?.pushViewController(productView, animated: true)
    }
}
