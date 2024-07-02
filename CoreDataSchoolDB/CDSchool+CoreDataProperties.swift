//
//  CDSchool+CoreDataProperties.swift
//  CoreDataSchoolDB
//
//  Created by Arshad Shaik on 12/12/23.
//
//

import Foundation
import CoreData


extension CDSchool {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDSchool> {
        return NSFetchRequest<CDSchool>(entityName: "CDSchool")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var toDepartment: Set<CDDepartment>?

}

// MARK: Generated accessors for toDepartment
extension CDSchool {

    @objc(addToDepartmentObject:)
    @NSManaged public func addToToDepartment(_ value: CDDepartment)

    @objc(removeToDepartmentObject:)
    @NSManaged public func removeFromToDepartment(_ value: CDDepartment)

    @objc(addToDepartment:)
    @NSManaged public func addToToDepartment(_ values: Set<CDDepartment>)

    @objc(removeToDepartment:)
    @NSManaged public func removeFromToDepartment(_ values: Set<CDDepartment>)

}

extension CDSchool : Identifiable {

}
