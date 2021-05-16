//
//  EmployerHireButtonHandler.swift
//  EmployeePortal
//
//  Created by Rushabh Singh on 16/05/21.
//

import UIKit

extension EmployeeListViewController : HireButtonProtocol {
    
    func updateHireStatus(id: Int) {
        var indexToBeUpdated = EmployeeConstant.defaultId
        (self.employeesList, indexToBeUpdated) = EmployeeHiringViewModel.getUpdatedEmployeesList(employees : self.employeesList! , id: id)
        if indexToBeUpdated != EmployeeConstant.defaultId {
            self.updateRow(row: indexToBeUpdated, section: 0)
        }
    }
   
}
