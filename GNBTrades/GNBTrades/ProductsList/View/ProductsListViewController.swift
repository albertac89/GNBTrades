//
//  ProductsListViewController.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 18/09/2021.
//

import UIKit

class ProductsListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var presenter: ProductsListPresenterProtocol
    private var data: [String] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    init(presenter: ProductsListPresenterProtocol) {
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
        presenter.viewDidLoad()
    }
    
    private func setupTableView() {
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UINib(nibName: ProductTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ProductTableViewCell.identifier)
    }
}

extension ProductsListViewController: ProductsListViewControllerProtocol {
    func setData(products: [String]) {
        DispatchQueue.main.async {
            self.data = products
        }
    }
    
    func showMessage(title: String, message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

extension ProductsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productSku = data[indexPath.row]
        let cell: ProductTableViewCell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as! ProductTableViewCell
        cell.configure(sku: productSku)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productSku = data[indexPath.row]
        guard let transactionsForProduct = presenter.getTransactionsForProductWith(sku: productSku) else { return }
        let productView = ProductBuilder.build(transactions: transactionsForProduct)
        self.navigationController?.pushViewController(productView, animated: true)
    }
}
