//
//  ViewController.swift
//  auto
//
//  Created by Аделя Миннехузина on 10.10.2023.
//

import UIKit

struct Car {
    let model: String
    let price: Int
    let image: UIImage?
}

protocol ShoppingCartDelegate: AnyObject {
    func shoppingCartDidUpdate()
}

class ViewController: UITableViewController, ShoppingCartDelegate {
    func shoppingCartDidUpdate() {
        
        let cartButton = BadgeButton(type: .custom)
        cartButton.setImage(UIImage(named: "cart"), for: .normal)
        cartButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        cartButton.addTarget(self, action: #selector(showShoppingCart), for: .touchUpInside)

        let cartBarButton = UIBarButtonItem(customView: cartButton)
        navigationItem.rightBarButtonItem = cartBarButton

        cartButton.badgeValue = "\(shoppingCart?.totalQuantity ?? 0)"

        tableView.reloadData()
    }
    
    var cars: [Car] = []
    var shoppingCart: ShoppingCart?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let car1 = Car(model: "Audi", price: 5000, image: UIImage(named: "orange"))
        let car2 = Car(model: "BMW", price: 6000, image: UIImage(named: "white"))
        let car3 = Car(model: "Mercedes", price: 7000, image: UIImage(named: "red"))
        let car4 = Car(model: "Ford", price: 8000, image: UIImage(named: "orange"))
        let car5 = Car(model: "Ferrari", price: 9000, image: UIImage(named: "white"))
        let car6 = Car(model: "Porsche", price: 10000, image: UIImage(named: "red"))
        cars = [car1, car2, car3, car4, car5, car6]
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        
        self.navigationItem.title = "Car Shop"
        let cartButton = UIBarButtonItem(title: "Cart", style: .plain, target: self, action: #selector(showShoppingCart))
        navigationItem.rightBarButtonItem = cartButton

        shoppingCart = ShoppingCart()
        shoppingCart?.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let car = cars[indexPath.row]
        cell.textLabel?.text = "\(car.model) - $\(car.price)"
        cell.imageView?.image = car.image
        cell.accessoryType = .none

        let addButton = UIButton(type: .contactAdd)
        addButton.addTarget(self, action:#selector(addToCart(_:)), for: .touchUpInside)
        cell.accessoryView = addButton
        
        return cell
    }
    
    @objc func addToCart(_ sender: UIButton) {
        guard let cell = sender.superview as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell),
              let shoppingCart = shoppingCart else {
            return
        }
        
        let car = cars[indexPath.row]
        shoppingCart.addCar(car)

    }
    
    @objc func showShoppingCart() {
        let shoppingCartViewController = ShoppingCartViewController()
        shoppingCartViewController.shoppingCart = shoppingCart
        navigationController?.pushViewController(shoppingCartViewController, animated: true)
    }
}

class BadgeButton: UIButton {
    
    var badgeValue: String? {
        didSet {
            setBadgeText()
        }
    }
    
    private var badgeLabel: UILabel?
    
    private func setBadgeText() {
        
        if let value = badgeValue, !value.isEmpty {
            
            if badgeLabel == nil {
                badgeLabel = UILabel(frame: CGRect(x: 4, y: 7, width: 30, height: 20))
                badgeLabel?.textAlignment = .center
                badgeLabel?.textColor = .white
                badgeLabel?.font = UIFont.systemFont(ofSize: 15)
                badgeLabel?.backgroundColor = .red
                badgeLabel?.layer.cornerRadius = 10
                badgeLabel?.clipsToBounds = true
                addSubview(badgeLabel!)
            }
            
            badgeLabel?.text = value
            
            let size = (value as NSString).size(withAttributes: [.font: UIFont.systemFont(ofSize: 12)])
            var frame = badgeLabel!.frame
            frame.size.width = max(20, size.width + 10)
            frame.size.height = 20
            badgeLabel!.frame = frame
            
            bringSubviewToFront(badgeLabel!)
            
        } else {
            badgeLabel?.removeFromSuperview()
            badgeLabel = nil
        }
    }
}


    


