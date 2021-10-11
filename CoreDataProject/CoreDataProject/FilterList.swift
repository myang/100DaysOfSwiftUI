//
//  FilterList.swift
//  CoreDataProject
//
//  Created by Eric Yang on 11.10.2021.
//

import SwiftUI
import CoreData

struct FilterList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var ships: FetchedResults<T> {fetchRequest.wrappedValue}
    
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) {ship in
            self.content(ship)
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}

//struct FilterList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterList()
//    }
//}
