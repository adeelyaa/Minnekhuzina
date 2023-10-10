//
//  ShoppingCartViewController.swift
//  auto
//
//  Created by Аделя Миннехузина on 10.10.2023.
//

import UIKit

class ShoppingCartViewController: UITableViewController {
    
    var shoppingCart: ShoppingCart?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        
        self.navigationItem.title = "My Cart"
        let closeButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(close))
        navigationItem.leftBarButtonItem = closeButton
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingCart?.totalQuantity ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let car = shoppingCart?.cars[indexPath.row]
        cell.textLabel?.text = "\(car?.model ?? "") - $\(car?.price ?? 0)"
        cell.imageView?.image = car?.image
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            shoppingCart?.removeCar(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    @objc func close() {
        navigationController?.popViewController(animated: true)
    }
}

