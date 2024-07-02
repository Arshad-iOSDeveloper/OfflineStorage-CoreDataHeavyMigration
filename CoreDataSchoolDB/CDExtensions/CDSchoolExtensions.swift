
import Foundation

extension CDSchool
{
  func convertToSchool() -> School
  {
    return School(_id: self.id!, _name: self.name!, _department: convertToDepartments())
  }
  
  private func convertToDepartments() -> [Department]?
  {
    guard self.toDepartment != nil && self.toDepartment?.count != 0 else {return nil}
    
    var departments: [Department] = []
    
    self.toDepartment?.forEach({ (department) in
      departments.append(department.convertToDepartment())
    })
    
    return departments
  }
}
