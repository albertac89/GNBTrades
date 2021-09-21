//
//  ProductViewController.swift
//  GNBTrades
//
//  Created by Aige Cortasa, Albert on 18/09/2021.
//

import UIKit

class ProductViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var presenter: ProductPresenterProtocol
    private var data: [Transaction] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    init(presenter: ProductPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setupTableView()
        presenter.viewDidLoad()
    }
    
    private func setupTableView() {
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UINib(nibName: TransactionTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TransactionTableViewCell.identifier)
    }
    
    private func configureView() {
        self.totalLabel.text = "Total transactions sum"
        self.totalLabel.font = .boldSystemFont(ofSize: 20)
        self.totalAmountLabel.text = "Calculating..."
        self.totalAmountLabel.font = .boldSystemFont(ofSize: 24)
    }
}

extension ProductViewController: ProductViewControllerProtocol {
    func configureNavBar(title: String) {
        self.title = title
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)
    }
    
    func setData(data: [Transaction]) {
        self.data = data
    }
    
    func configureSumWith(total: String, currency: String) {
        DispatchQueue.main.async {
            self.totalAmountLabel.text = "\(total) \(currency)"
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

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let transaction = data[indexPath.row]
        let cell: TransactionTableViewCell = tableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.identifier, for: indexPath) as! TransactionTableViewCell
        cell.configure(model: transaction)
        cell.selectionStyle = .none
        return cell
    }
}
