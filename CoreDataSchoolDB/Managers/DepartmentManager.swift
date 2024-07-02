
import Foundation

struct DepartmentManager
{
  private let _departmentDataRepository = DepartmentDataRepository()
  
  func createDepartment(record: Department) -> Bool
  {
    guard record.students != nil else {return false}
    _departmentDataRepository.create(record: record)
    
    return true
  }
  
  func addStudentIntoDepartment(byId id: UUID) -> Bool {
    _departmentDataRepository.addStudentIntoDepartment(byId: id)
  }
  
  func getAll() -> [Department]?
  {
    return _departmentDataRepository.getAll()
  }
}
