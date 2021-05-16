//
//  EmployeeListViewDelegate.swift
//  EmployeePortal
//
//  Created by Rushabh Singh on 15/05/21.
//

import UIKit

extension EmployeeListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.employeesList?.count ?? 0 > indexPath.row{
            let employeeModel : EmployeeViewModel? = self.employeesList?[indexPath.row]
            if let employee = employeeModel {
                showEmployeeDetailFor(employeeDetail: employee)
            }
        }
    }
    
    func showEmployeeDetailFor(employeeDetail: EmployeeViewModel){
        DispatchQueue.main.async {
            let employeeDetailVC = EmployeeDetailViewController(employeeDetail: employeeDetail)
            employeeDetailVC.delegate = self
            self.navigationController?.pushViewController(employeeDetailVC, animated: true)
        }
    }
}
