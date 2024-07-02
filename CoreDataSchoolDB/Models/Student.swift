//
//  Student.swift
//  CoreDataSchoolDB
//
//  Created by Arshad Shaik on 12/12/23.
//

import Foundation

class Student
{
  let id: UUID
  let name: String
  
  init(_id: UUID, _name: String)
  {
    self.id = _id
    self.name = _name
  }
}
