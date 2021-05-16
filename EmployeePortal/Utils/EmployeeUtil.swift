//
//  EmployeeUtil.swift
//  EmployeePortal
//
//  Created by Rushabh Singh on 16/05/21.
//

import Foundation

struct EmployeeUtil {
    
    static func getValidStringFrom(input : String?) -> String{
        if let input = input{
            return input.isEmpty ? EmployeeConstant.notAvailable : input
        }
        return  EmployeeConstant.notAvailable
    }
}
