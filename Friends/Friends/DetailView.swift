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
                    
                    ForEach(user.friends, id: \.id) {friend in
                        Button("\(friend.name)") {
                            DetailView(users: users, user: friend)
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
    
    init(users: [User], user: User) {
        self.users = users
        
        if let match = users.first(where: {$0.name == user.name}) {
            self.user = match
        } else {
            self.user = user
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(users: [User](), user: User(id: "", isActive: false, name: "", age: 0, company: "", email: "", address: "", about: "", registered: "", tags: [String](), friends: [User.Friend]()))
    }
}
