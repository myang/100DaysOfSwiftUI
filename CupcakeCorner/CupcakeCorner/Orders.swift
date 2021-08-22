//
//  Orders.swift
//  Orders
//
//  Created by Eric Yang on 22.8.2021.
//

import SwiftUI

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    @Published var specialRequestEnabled = false
    @Published var extraFrosting = false
    @Published var addPrinkles = false
    
    
}
