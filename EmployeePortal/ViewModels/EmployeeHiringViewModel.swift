//
//  EmployeeHiringViewModel.swift
//  EmployeePortal
//
//  Created by Rushabh Singh on 16/05/21.
//

import UIKit

struct EmployeeHiringViewModel {
    
    func getUpdatedEmployeesList(employees : [EmployeeViewModel] , id: Int) -> ([EmployeeViewModel] , Int){
        var updatedEmployees = employees
        if let index = employees.firstIndex(where: {$0.employeeId == id}) {
            let employeeToBeUpdated = employees[index]
            updatedEmployees[index] = self.getUpdatedEmployee(employee: employeeToBeUpdated)
            return (updatedEmployees,index)
        }
        return (updatedEmployees,EmployeeConstant.defaultId)
    }
    
    func getUpdatedEmployee(employee : EmployeeViewModel) -> EmployeeViewModel {
        var updatedEmployee = employee
        //Updating Hiring status 
        updatedEmployee.isHired = !updatedEmployee.isHired
        updatedEmployee.employeeStatus = self.getHireStatus(employee: updatedEmployee)
        return updatedEmployee
    }
    
    func getHireStatus(employee : EmployeeViewModel) -> String {
        return employee.isHired ? EmployeeConstant.hired : EmployeeConstant.notHired
    }
    
}
