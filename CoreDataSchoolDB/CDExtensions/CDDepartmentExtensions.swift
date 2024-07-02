
import Foundation

extension CDDepartment
{
  func convertToDepartment() -> Department
  {
    return Department(_id: self.id!, _name: self.name!, _student: convertToStudents())
  }
  
  private func convertToStudents() -> [Student]?
  {
    guard self.toStudent != nil && self.toStudent?.count != 0 else {return nil}
    
    var students: [Student] = []
    
    self.toStudent?.forEach({ (student) in
      students.append(student.convertToStudent())
    })
    
    return students
  }
}
