//
//  StudentManager.swift
//  CoreDataSchoolDB
//
//  Created by Arshad Shaik on 12/12/23.
//

import Foundation

struct StudentManager {
  
  private let _studentDataRepository = StudentDataRepository()
  
  func createStudent(record: Student)
  {
    _studentDataRepository.create(record: record)
  }
  
  func getAll() -> [Student]?
  {
    return _studentDataRepository.getAll()
  }
}
