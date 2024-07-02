//
//  CDDepartment+CoreDataProperties.swift
//  CoreDataSchoolDB
//
//  Created by Arshad Shaik on 12/12/23.
//
//

import Foundation
import CoreData


extension CDDepartment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDDepartment> {
        return NSFetchRequest<CDDepartment>(entityName: "CDDepartment")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var toSchool: CDSchool?
    @NSManaged public var toStudent: Set<CDStudent>?

}

// MARK: Generated accessors for toStudent
extension CDDepartment {

    @objc(addToStudentObject:)
    @NSManaged public func addToToStudent(_ value: CDStudent)

    @objc(removeToStudentObject:)
    @NSManaged public func removeFromToStudent(_ value: CDStudent)

    @objc(addToStudent:)
    @NSManaged public func addToToStudent(_ values: Set<CDStudent>)

    @objc(removeToStudent:)
    @NSManaged public func removeFromToStudent(_ values: Set<CDStudent>)

}

extension CDDepartment : Identifiable {

}
