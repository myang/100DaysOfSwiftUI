//
//  Ship+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Eric Yang on 11.10.2021.
//
//

import Foundation
import CoreData


extension Ship {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ship> {
        return NSFetchRequest<Ship>(entityName: "Ship")
    }

    @NSManaged public var name: String?
    @NSManaged public var universe: String?
    
    var wrappedName: String {
        name ?? "Unknown name"
    }
    
    var wrappedUniverse: String {
        universe ?? "Unknown universe"
    }

}

extension Ship : Identifiable {

}
