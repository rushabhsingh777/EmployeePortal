//
//  EmployeeModel.swift
//  EmployeePortal
//
//  Created by Rushabh Singh on 15/05/21.
//

struct EmployeeModel: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

struct Address: Codable {
    let street, suite, city, zipcode: String
}

struct Company: Codable {
    let name, catchPhrase, bs: String
}

