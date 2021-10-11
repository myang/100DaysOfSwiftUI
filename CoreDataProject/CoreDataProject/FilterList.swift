//
//  FilterList.swift
//  CoreDataProject
//
//  Created by Eric Yang on 11.10.2021.
//

import SwiftUI

struct FilterList: View {
    var fetchRequest: FetchRequest<Ship>
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) {ship in
            Text("\(ship.wrappedName) \(ship.wrappedUniverse)")
        }
    }
    
    init(filter: String) {
        fetchRequest = FetchRequest<Ship>(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "name BEGINSWITH %@", filter))
    }
}

//struct FilterList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterList()
//    }
//}
