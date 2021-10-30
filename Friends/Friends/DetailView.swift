//
//  DetailView.swift
//  Friends
//
//  Created by Eric Yang on 27.10.2021.
//

import SwiftUI

struct DetailView: View {
    let users: [User]
    let user: User
    
    var body: some View {
        GeometryReader {geometry in
            VStack(alignment: .leading) {
                Group {
                    Text("**Age**:\n \(user.age)")
                    Spacer()
                    Text("**Company**:\n \(user.company)")
                    Spacer()
                    Text("**Email**:\n \(user.email)")
                    Spacer()
                    Text("**Address**:\n \(user.address)")
                    Spacer()
                }
                Group {
                    Text("**Friends**:")
                    
                    ForEach(user.friends) {friend in
                        if let match = users.first(where: {$0.name == friend.name}) {
                            NavigationLink("\(friend.name)", destination: DetailView(users: users, user: match))
                        }
                    }

                    ScrollView(.vertical) {
                        Text("**About**:\n \(user.about)")
                    }
                }
            }
            .padding()
        }.navigationTitle("\(user.name)")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(users: [User](), user: User(id: "", isActive: false, name: "", age: 0, company: "", email: "", address: "", about: "", registered: "", tags: [String](), friends: [User.Friend]()))
    }
}
