
import Foundation
import CoreData

protocol DepartmentRepository : BaseRepository {
  
}

struct DepartmentDataRepository: DepartmentRepository {
  typealias T = Department
  
  func create(record: Department) {
    
    let cdDepartment = CDDepartment(context: PersistentStorage.shared.context)
    cdDepartment.id = record.id
    cdDepartment.name = record.name
    
    if(record.students != nil && record.students?.count != 0)
    {
      var studentSet = Set<CDStudent>()
      record.students?.forEach({ (student) in
        
        let cdStudent = CDStudent(context: PersistentStorage.shared.context)
        cdStudent.id = student.id
        cdStudent.firstName = student.name
        
        studentSet.insert(cdStudent)
      })
      
      cdDepartment.toStudent = studentSet
    }
    
    PersistentStorage.shared.saveContext()
  }
  
  func getAll() -> [Department]? {
    let records = PersistentStorage.shared.fetchManagedObject(managedObject: CDDepartment.self)
    guard records != nil && records?.count != 0 else {return nil}
    
    var results: [Department] = []
    records!.forEach({ (cdDepartment) in
      results.append(cdDepartment.convertToDepartment())
    })
    
    return results
  }
  
  func get(byIdentifier id: UUID) -> Department? {
    
    let department = getCdDepartment(byId: id)
    guard department != nil else {return nil}
    return (department?.convertToDepartment())!
  }
  
  func update(record: Department) -> Bool {
    let department = getCdDepartment(byId: record.id)
    guard department != nil else {return false}
    
    department?.name = record.name
    
    PersistentStorage.shared.saveContext()
    return true
  }
  
  func addStudentIntoDepartment(byId id: UUID) -> Bool {
    let department = getCdDepartment(byId: id)
    guard department != nil else {return false}
    
    var studentSet = Set<CDStudent>()
    let cdStudent = CDStudent(context: PersistentStorage.shared.context)
    cdStudent.id = UUID()
    cdStudent.firstName = "Vikas"
    studentSet.insert(cdStudent)
        
    department?.toStudent = studentSet
    PersistentStorage.shared.saveContext()
    return true
  }
  
  func delete(byIdentifier id: UUID) -> Bool {
    
    let department = getCdDepartment(byId: id)
    guard department != nil else {return false}
    
    PersistentStorage.shared.context.delete(department!)
    PersistentStorage.shared.saveContext()
    
    return true
  }
  
  private func getCdDepartment(byId id: UUID) -> CDDepartment?
  {
    let fetchRequest = NSFetchRequest<CDDepartment>(entityName: "CDDepartment")
    let fetchById = NSPredicate(format: "id==%@", id as CVarArg)
    fetchRequest.predicate = fetchById
    
    let result = try! PersistentStorage.shared.context.fetch(fetchRequest)
    guard result.count != 0 else {return nil}
    
    return result.first
  }
  
}
