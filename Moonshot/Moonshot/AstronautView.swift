//
//  AstronautView.swift
//  AstronautView
//
//  Created by Mu Yang on 21.7.2021.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions: [Mission]

    var body: some View {
        GeometryReader {geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    //show flew missions
                    Text("Missions:")
                        .font(.headline)
                    
                    HStack {
                        ForEach(missions) {mission in
                            Text(mission.displayName)
                        }
                    }
                    
                    Text(astronaut.description)
                        .padding()
                }
            }
            
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        let missions: [Mission] = Bundle.main.decode("missions.json")
        var matches = [Mission]()

        for mission in missions {
            if let _ = mission.crew.first(where: {$0.name == astronaut.id}) {
                matches.append(mission)
            }
        }
        print("\(astronaut.id), missions: \(matches.count)")
        self.missions = matches
    }
}

struct AstronautView_Previews: PreviewProvider {
    static var previews: some View {
        AstronautView(astronaut: Astronaut(id: "", name: "", description: ""))
    }
}
