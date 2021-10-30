//
//  ContentView.swift
//  Friends
//
//  Created by Eric Yang on 23.10.2021.
//

import SwiftUI

struct ContentView: View {
   @State private var users = [User]()

    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    NavigationLink (destination: DetailView(users: users, user: user)) {
                        Text("\(user.name)")
                    }
                }
            }
            .onAppear(perform: loadData)
            .navigationTitle("Friends")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    func loadData() {
//        let users: [User] = Bundle.main.decode("friendface.json")
//        self.users = users
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
                print("Invalid URL")
                return
        }

        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                    DispatchQueue.main.async {
                        self.users = decodedResponse
                        return
                    }
                } else {
                    print("Fetch data failed: \(error?.localizedDescription ?? "Unknown error")")
                }
            }
        }.resume()
    }
}

struct User: Codable, Identifiable {
    struct Friend: Codable, Identifiable {
        let id: String
        let name: String
    }

    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    let friends: [Friend]
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
