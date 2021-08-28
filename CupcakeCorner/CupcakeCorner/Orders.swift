//
//  Orders.swift
//  Orders
//
//  Created by Eric Yang on 22.8.2021.
//

import SwiftUI

class Order: ObservableObject, Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    @Published var address = Address()
    
    var cost: Double {
        var cost = Double(quantity) * 2
        cost += (Double(type) / 2)
        
        if extraFrosting {
            cost += Double(quantity)
        }
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        return cost
    }
    
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, street, city, zip
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)

        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)

        try container.encode(address.name, forKey: .name)
        try container.encode(address.street, forKey: .street)
        try container.encode(address.city, forKey: .city)
        try container.encode(address.zip, forKey: .zip)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)

        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)

        address.name = try container.decode(String.self, forKey: .name)
        address.street = try container.decode(String.self, forKey: .street)
        address.city = try container.decode(String.self, forKey: .city)
        address.zip = try container.decode(String.self, forKey: .zip)
    }
    
    init() { }
}

struct Address {
    var name = ""
    var street = ""
    var city = ""
    var zip = ""

    var hasValidAddress: Bool {
        if name.isEmpty || street.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        if name.trimmingCharacters(in: .whitespaces).isEmpty ||
            street.trimmingCharacters(in: .whitespaces).isEmpty ||
            city.trimmingCharacters(in: .whitespaces).isEmpty ||
            zip.trimmingCharacters(in: .whitespaces).isEmpty {
            return false
        }
        
        return true
    }
}
