//
//  Wizard+CoreDataProperties.swift
//  Wizard
//
//  Created by Eric Yang on 5.10.2021.
//
//

import Foundation
import CoreData


extension Wizard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Wizard> {
        return NSFetchRequest<Wizard>(entityName: "Wizard")
    }

    @NSManaged public var name: String?
}

extension Wizard : Identifiable {

}
