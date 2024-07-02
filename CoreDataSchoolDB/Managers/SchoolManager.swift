
import Foundation

struct SchoolManager
{
  private let _schoolDataRepository = SchoolDataRepository()
  
  func createSchool(record: School) -> Bool
  {
    guard record.departments != nil else {return false}
    _schoolDataRepository.create(record: record)
    
    return true
  }
  
  func getAll() -> [School]?
  {
    return _schoolDataRepository.getAll()
  }
}
