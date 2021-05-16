//
//  EmployeeListViewDataSource.swift
//  EmployeePortal
//
//  Created by Rushabh Singh on 15/05/21.
//
import UIKit

extension EmployeeListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employeesList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let employeeCell = employeesTableView.dequeueReusableCell(withIdentifier: EMPLOYEE_CELL_IDENTIFIER, for: indexPath) as! EmployeeTableViewCell
        employeeCell.delegate = self
        if self.employeesList?.count ?? 0 > indexPath.row{
            let employeeModel : EmployeeViewModel? = self.employeesList?[indexPath.row]
            if let employee = employeeModel {
                employeeCell.employeeViewModel = employee
            }
        }
        return employeeCell
    }
    
    func updateRow(row: Int, section: Int){
        let indexPath = IndexPath(row: row, section: section)
        self.employeesTableView.beginUpdates()
        self.employeesTableView.reloadRows(at: [indexPath], with: .automatic)
        self.employeesTableView.endUpdates()
    }
    
}
