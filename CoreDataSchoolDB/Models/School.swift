

import Foundation

class School
{
  let id: UUID
  let name: String
  var departments: [Department]?
  
  init(_id: UUID, _name: String, _department: [Department]? = nil)
  {
    self.id = _id
    self.name = _name
    self.departments = _department
  }
}
