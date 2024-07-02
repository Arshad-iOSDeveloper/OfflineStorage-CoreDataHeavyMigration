
import Foundation
import CoreData

protocol SchoolRepository : BaseRepository {
  
}

struct SchoolDataRepository : SchoolRepository {
  typealias T = School
  
  func create(record: School) {
    
    let cdSchool = CDSchool(context: PersistentStorage.shared.context)
    cdSchool.id = record.id
    cdSchool.name = record.name
    
    if(record.departments != nil && record.departments?.count != 0)
    {
      var departmentSet = Set<CDDepartment>()
      record.departments?.forEach({ (department) in
        
        let cdDepartment = CDDepartment(context: PersistentStorage.shared.context)
        cdDepartment.id = department.id
        cdDepartment.name = department.name
        
        /// store students data
        if(department.students != nil && department.students?.count != 0)
        {
          var studentSet = Set<CDStudent>()
          department.students?.forEach({ (student) in
            
            let cdStudent = CDStudent(context: PersistentStorage.shared.context)
            cdStudent.id = student.id
            cdStudent.firstName = student.name
            
            studentSet.insert(cdStudent)
          })
          
          cdDepartment.toStudent = studentSet
        }
        
        departmentSet.insert(cdDepartment)
      })
      
      cdSchool.toDepartment = departmentSet
    }
    
    PersistentStorage.shared.saveContext()
    
  }
  
  func getAll() -> [School]? {
    
    let records = PersistentStorage.shared.fetchManagedObject(managedObject: CDSchool.self)
    guard records != nil && records?.count != 0 else {return nil}
    
    var results: [School] = []
    records!.forEach({ (cdSchool) in
      results.append(cdSchool.convertToSchool())
    })
    
    return results
  }
  
  func get(byIdentifier id: UUID) -> School? {
    
    let school = getCdSchool(byId: id)
    guard school != nil else {return nil}
    
    return (school?.convertToSchool())!
  }
  
  func update(record: School) -> Bool {
    
    let school = getCdSchool(byId: record.id)
    guard school != nil else {return false}
    school?.name = record.name
    
    PersistentStorage.shared.saveContext()
    return true
  }
  
  func delete(byIdentifier id: UUID) -> Bool {
    
    let school = getCdSchool(byId: id)
    guard school != nil else {return false}
    
    PersistentStorage.shared.context.delete(school!)
    PersistentStorage.shared.saveContext()
    
    return true
  }
  
  private func getCdSchool(byId id: UUID) -> CDSchool?
  {
    let fetchRequest = NSFetchRequest<CDSchool>(entityName: "CDSchool")
    let fetchById = NSPredicate(format: "id==%@", id as CVarArg)
    fetchRequest.predicate = fetchById
    
    let result = try! PersistentStorage.shared.context.fetch(fetchRequest)
    guard result.count != 0 else {return nil}
    
    return result.first
  }

}
