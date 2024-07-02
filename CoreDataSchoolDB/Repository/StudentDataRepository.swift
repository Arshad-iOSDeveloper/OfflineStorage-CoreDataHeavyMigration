
import Foundation
import CoreData

protocol StudentRepository : BaseRepository {
  
}

struct StudentDataRepository: StudentRepository {
  typealias T = Student
  
  func create(record: Student) {
    
    let cdStudent = CDStudent(context: PersistentStorage.shared.context)
    cdStudent.id = record.id
    cdStudent.firstName = record.name
    
    PersistentStorage.shared.saveContext()
  }
  
  func getAll() -> [Student]? {
    let records = PersistentStorage.shared.fetchManagedObject(managedObject: CDStudent.self)
    guard records != nil && records?.count != 0 else {return nil}
    
    var results: [Student] = []
    records!.forEach({ (cdStudent) in
      results.append(cdStudent.convertToStudent())
    })
    
    return results
  }
  
  func get(byIdentifier id: UUID) -> Student? {
    
    let student = getCdStudent(byId: id)
    guard student != nil else {return nil}
    return (student?.convertToStudent())!
  }
  
  func update(record: Student) -> Bool {
    let student = getCdStudent(byId: record.id)
    guard student != nil else {return false}
    
    student?.firstName = record.name
    
    PersistentStorage.shared.saveContext()
    return true
  }
  
  func delete(byIdentifier id: UUID) -> Bool {
    
    let student = getCdStudent(byId: id)
    guard student != nil else {return false}
    
    PersistentStorage.shared.context.delete(student!)
    PersistentStorage.shared.saveContext()
    
    return true
  }
  
  private func getCdStudent(byId id: UUID) -> CDStudent?
  {
    let fetchRequest = NSFetchRequest<CDStudent>(entityName: "CDStudent")
    let fetchById = NSPredicate(format: "id==%@", id as CVarArg)
    fetchRequest.predicate = fetchById
    
    let result = try! PersistentStorage.shared.context.fetch(fetchRequest)
    guard result.count != 0 else {return nil}
    
    return result.first
  }
  
}

