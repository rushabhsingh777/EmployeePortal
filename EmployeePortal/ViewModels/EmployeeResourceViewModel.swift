//
//  EmployeeResource.swift
//  EmployeePortal
//
//  Created by Rushabh Singh on 16/05/21.
//

import Foundation

struct EmployeeResourceViewModel {
    
    func getEmployeesList(urlString : String , completion : @escaping (_ employees : [EmployeeViewModel]) -> Void) {
        var employeesList = [EmployeeViewModel]()
        HttpUtil.shared.getData(urlString: urlString, responseType: [EmployeeModel].self) { (response) in
            if let response = response {
                employeesList = response.map({
                    return EmployeeViewModel(employee : $0)
                })
            }
            completion(employeesList)
        }
    }
    
}
