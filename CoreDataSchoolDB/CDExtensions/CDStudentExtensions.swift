//
//  CDStudentExtensions.swift
//  CoreDataSchoolDB
//
//  Created by Arshad Shaik on 12/12/23.
//

import Foundation

extension CDStudent {
  
  func convertToStudent() -> Student
  {
    return Student(_id: self.id!, _name: self.firstName!)
  }
  
}
