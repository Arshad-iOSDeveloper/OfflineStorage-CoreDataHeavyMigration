//
//  CDStudent+CoreDataProperties.swift
//  CoreDataSchoolDB
//
//  Created by Arshad Shaik on 12/12/23.
//
//

import Foundation
import CoreData


extension CDStudent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDStudent> {
        return NSFetchRequest<CDStudent>(entityName: "CDStudent")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var id: UUID?
    @NSManaged public var lastName: String?
    @NSManaged public var toAddress: CDAddress?
    @NSManaged public var toDepartment: CDDepartment?

}

extension CDStudent : Identifiable {

}
