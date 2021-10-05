//
//  Movie+CoreDataProperties.swift
//  Movie
//
//  Created by Eric Yang on 5.10.2021.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var director: String?
    @NSManaged public var title: String?
    @NSManaged public var year: Int16

}

extension Movie : Identifiable {

}
