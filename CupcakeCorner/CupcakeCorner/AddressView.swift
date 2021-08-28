//
//  AddressView.swift
//  AddressView
//
//  Created by Eric Yang on 22.8.2021.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.address.name)
                TextField("Street Address", text: $order.address.street)
                TextField("City", text: $order.address.city)
                TextField("Zip", text: $order.address.zip)

            }
            Section {
                NavigationLink(destination: CheckoutView(order: order)) {
                    Text("Check out")
                }
            }
            .disabled(order.address.hasValidAddress == false)
        }
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
