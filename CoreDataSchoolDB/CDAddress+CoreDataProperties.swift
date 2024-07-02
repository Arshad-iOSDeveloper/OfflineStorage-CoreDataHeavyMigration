//
//  CDAddress+CoreDataProperties.swift
//  CoreDataSchoolDB
//
//  Created by Arshad Shaik on 12/12/23.
//
//

import Foundation
import CoreData


extension CDAddress {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDAddress> {
        return NSFetchRequest<CDAddress>(entityName: "CDAddress")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var toStudent: CDStudent?

}

extension CDAddress : Identifiable {

}
