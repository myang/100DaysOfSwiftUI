//
//  CheckoutView.swift
//  CheckoutView
//
//  Created by Eric Yang on 22.8.2021.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    @State private var alertTitle = ""
    @State private var alertMsg = ""
    @State private var showAlert = false
    
    var body: some View {
        GeometryReader {geo in
            VStack {
                Image("cupcakes")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width)
                
                Text("Your total is $\(self.order.cost, specifier: "%.2f")")
                    .font(.title)
                
                Button("Place Order") {
                    self.placeOrder()
                }
                .padding()
            }
        }
        .navigationBarTitle("Check out", displayMode: .inline)
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMsg), dismissButton: .default(Text("OK")))
        }
    }

    func placeOrder() {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let error = error {
                self.alertTitle = "Sorry:("
                self.alertMsg = error.localizedDescription
                self.showAlert = true
                return
            }
            
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                self.alertTitle = "Thank you!"
                self.alertMsg = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
                self.showAlert = true
            } else {
                print("Invalid response from server")
            }
            
        }.resume()
    }
}


struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
