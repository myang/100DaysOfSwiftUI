//
//  ContentView.swift
//  Moonshot
//
//  Created by Mu Yang on 24.6.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                Image("punkaharju-small")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width)
            }
        
            NavigationView {
                List(0..<100) { row in
                    NavigationLink(destination: Text("Detail \(row)")) {
                        Text("Row \(row)")
                    }
                }
                .navigationBarTitle("SwiftUI")
            }
            
            Button("Decode JSON") {
                let input = """
                {
                    "name": "Taylor Swift",
                    "address": {
                        "street": "555, Taylor Avenue",
                        "city": "Nashville"
                    }
                }
                """
                
                struct User: Codable {
                    var name: String
                    var address: Address
                }
                
                struct Address: Codable {
                    var street: String
                    var city: String
                }
                
                let data = Data(input.utf8)
                let decoder = JSONDecoder()
                if let user = try? decoder.decode(User.self, from: data) {
                    print(user.address.street)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
