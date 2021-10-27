//
//  DetailView.swift
//  Friends
//
//  Created by Eric Yang on 27.10.2021.
//

import SwiftUI

struct DetailView: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Age: \(user.age)")
            Text("Company: \(user.company)")
            Text("Email: \(user.email)")
            Text("Address: \(user.address)").fixedSize(horizontal: false, vertical: true)
            Text("About: \(user.about)").fixedSize(horizontal: false, vertical: true)
        }
        .frame(width: 300, height: 20)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: User(id: "", isActive: false, name: "", age: 0, company: "", email: "", address: "", about: "", registered: "", tags: [String](), friends: [User.Friend]()))
    }
}
