//
//  ShoppingCart.swift
//  auto
//
//  Created by Аделя Миннехузина on 10.10.2023.
//

import Foundation

class ShoppingCart {

    var cars: [Car] = []

    var totalQuantity: Int {
        return cars.count
    }

    weak var delegate: ShoppingCartDelegate?

    func addCar(_ car: Car) {
        cars.append(car)
        delegate?.shoppingCartDidUpdate()
    }

    func removeCar(at index: Int) {
        cars.remove(at: index)
        delegate?.shoppingCartDidUpdate()
    }
}



