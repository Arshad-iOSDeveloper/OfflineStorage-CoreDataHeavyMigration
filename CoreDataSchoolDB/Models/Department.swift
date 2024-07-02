
import Foundation

class Department
{
  let id: UUID
  let name: String
  var students: [Student]?
  
  init(_id: UUID, _name: String, _student: [Student]?)
  {
    self.id = _id
    self.name = _name
    self.students = _student
  }
}
