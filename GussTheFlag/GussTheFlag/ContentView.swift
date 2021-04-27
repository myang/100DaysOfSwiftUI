//
//  ContentView.swift
//  GussTheFlag
//
//  Created by Mu Yang on 26.4.2021.
//

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(spacing: 30){
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                }
            
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        //flag was tapped
                        
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                    }
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
