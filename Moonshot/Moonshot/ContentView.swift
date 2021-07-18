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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
