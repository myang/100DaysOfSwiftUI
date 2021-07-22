//
//  MissionView.swift
//  MissionView
//
//  Created by Mu Yang on 20.7.2021.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    let crewMembers: [CrewMember]
    
    var body: some View {
        GeometryReader {geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.7)
                        .padding(.top)
                    
                    Text(mission.formattedLuanchDate)
                    Text(mission.description)
                        .padding()
                    
                    ForEach(crewMembers, id: \.role) {crewMember in
                        NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut)) {
                            HStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width: 83, height: 60)
                                    .clipShape(Capsule())
                                    .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                                
                                VStack(alignment: .leading) {
                                    Text(crewMember.astronaut.name)
                                        .font(.headline)
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    
                    Spacer(minLength: 25)
                }
            }
            .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
        }
    }
    
    init(mission: Mission) {
        self.mission = mission
        let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
        var matches = [CrewMember]()
        
        for member in mission.crew {
            if let match = astronauts.first(where: {$0.id == member.name}) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }
        self.crewMembers = matches
    }
}

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct MissionView_Previews: PreviewProvider {    
    static var previews: some View {
        MissionView(mission: Mission(id: 0, launchDate: Date(), crew: [Mission.CrewRole](), description: ""))
    }
}
