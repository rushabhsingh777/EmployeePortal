//
//  EmployeeViewModel.swift
//  EmployeePortal
//
//  Created by Rushabh Singh on 15/05/21.
//

import UIKit

struct EmployeeViewModel {
    let employeeName : String
    let employeeUserName : String
    let employeeContact : String
    let employeeEmailId : String
    let employeeCompany : String
    let employeeCompanyTagline : String
    let employeeCompleteAddress : String
    var employeeStatus : String = EmployeeConstant.notHired
    let employeeId : Int
    var isHired : Bool = false
    
    init(employee : EmployeeModel?) {
        self.employeeId = employee?.id ?? 0
        self.employeeName = EmployeeUtil.getValidStringFrom(input : employee?.name)
        self.employeeUserName = EmployeeUtil.getValidStringFrom(input : employee?.username)
        self.employeeContact = EmployeeUtil.getValidStringFrom(input : employee?.phone)
        self.employeeEmailId = EmployeeUtil.getValidStringFrom(input : employee?.email)
        self.employeeCompanyTagline = EmployeeUtil.getValidStringFrom(input : employee?.company.catchPhrase)
        self.employeeCompany = EmployeeUtil.getValidStringFrom(input : employee?.company.name)
        self.employeeCompleteAddress = EmployeeViewModel.getCompleteAddressOfEmployee(address : employee?.address)
    }
    
    static func getCompleteAddressOfEmployee(address : Address?) -> String{
        if let address = address{
            var completeAddress = ""
            if !address.street.isEmpty{
                completeAddress = address.street + " "
            }
            if !address.suite.isEmpty{
                completeAddress += address.suite + " "
            }
            if !address.city.isEmpty{
                completeAddress += address.city + " "
            }
            if !address.zipcode.isEmpty{
                completeAddress += address.zipcode
            }
            return completeAddress.isEmpty ? EmployeeConstant.notAvailable : completeAddress
        }
        return EmployeeConstant.notAvailable
    }
}
