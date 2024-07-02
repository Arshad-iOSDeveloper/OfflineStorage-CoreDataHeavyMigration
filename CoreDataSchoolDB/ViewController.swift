//
//  ViewController.swift
//  CoreDataSchoolDB
//
//  Created by Arshad Shaik on 12/12/23.
//

import UIKit

class ViewController: UIViewController {
  
  private let manager = SchoolManager()
  private let departmentManager = DepartmentManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    debugPrint(path[0])
  }
  
  // MARK: - Actions -
  @IBAction func addTapped(_ sender: UIButton) {
    createSchool()
  }
  
  @IBAction func fetchTapped(_ sender: UIButton) {
    getSavedSchool()
  }
  
  @IBAction func updateTapped(_ sender: UIButton) {
//    print("Updated: ", departmentManager.addStudentIntoDepartment(byId: 2))
  }
  
  @IBAction func deleteTapped(_ sender: UIButton) {
    
  }
  
}

extension ViewController {
  func createSchool() {
    let student1 = Student(_id: UUID(), _name: "Arshad")
    let student2 = Student(_id: UUID(), _name: "Parth")
    
    let department1 = Department(_id: UUID(), _name: "Engineering", _student: [student1, student2])
    
    let student3 = Student(_id: UUID(), _name: "Yash")
    let student4 = Student(_id: UUID(), _name: "Aayush")
    let department2 = Department(_id: UUID(), _name: "Product", _student: [student3, student4])
    
    let school = School(_id: UUID(), _name: "Crelio", _department: [department1, department2])
    
    let result = manager.createSchool(record: school)
    if(result == true)
    {
      debugPrint("record saved successfully")
    }
    else
    {
      debugPrint("Create failed")
    }
  }
  
  func getSavedSchool()
  {
    let school = manager.getAll()
    school?.forEach({ (savedSchool) in
      
      savedSchool.departments?.forEach({ (savedDepartment) in
        debugPrint("\(savedSchool.name) has \(savedDepartment.name) which has students count: \(savedDepartment.students?.count ?? 0)")
      })
    })
  }
}
