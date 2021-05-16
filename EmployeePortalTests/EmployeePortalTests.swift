//
//  EmployeePortalTests.swift
//  EmployeePortalTests
//
//  Created by Rushabh Singh on 15/05/21.
//

import XCTest
@testable import EmployeePortal

class EmployeePortalTests: XCTestCase {
    let validAddress = Address(street: "MG market", suite: "Suite 007", city: "Lachen", zipcode: "421503")
    let inValidAddress = Address(street: "", suite: "", city: "", zipcode: "")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testValidEmployeeViewModel(){
        let company = Company(name: "Whatsapp", catchPhrase: "We respect privacy", bs: "Just kidding")
        let employeeModel = EmployeeModel(id: 2, name: "Rushabh", username: "rk777", email: "rushabhsingh777@gmail.com", address: validAddress, phone: "8888888888", website: "whatsapp.com", company: company)
        let employeeViewModel = EmployeeViewModel(employee: employeeModel)
        
        XCTAssertEqual(employeeViewModel.employeeName, employeeModel.name, "Name is correct")
        XCTAssertEqual(employeeViewModel.employeeCompany, company.name, "employeeCompany Name is correct")
        XCTAssertEqual(employeeViewModel.employeeStatus, EmployeeConstant.notHired, "Employee is not hired")
        XCTAssertEqual(employeeViewModel.employeeEmailId, employeeModel.email, "employee email is correct")
    }
    
    func testInValidEmployeeViewModel(){
        let company = Company(name: "", catchPhrase: "", bs: "")
        let employeeModel = EmployeeModel(id: 2, name: "", username: "rk777", email: "rushabhsingh777@gmail.com", address: inValidAddress, phone: "", website: "", company: company)
        let employeeViewModel = EmployeeViewModel(employee: employeeModel)
        
        XCTAssertEqual(employeeViewModel.employeeName, EmployeeConstant.notAvailable, "Name is not available")
        XCTAssertEqual(employeeViewModel.employeeCompany, EmployeeConstant.notAvailable, "Company name is not available")
        XCTAssertEqual(employeeViewModel.employeeStatus, EmployeeConstant.notHired, "Employee is not hired")
        XCTAssertEqual(employeeViewModel.employeeEmailId, employeeModel.email, "employee email is correct")
        
        XCTAssertEqual(employeeViewModel.employeeContact, EmployeeConstant.notAvailable, "Contact is not available")
    }
    
    func testValidEmployeeAddress(){
        let address = Address(street: "MG market", suite: "Suite 007", city: "Lachen", zipcode: "421503")
        let company = Company(name: "Whatsapp", catchPhrase: "We respect privacy", bs: "Just kidding")
        let employeeModel = EmployeeModel(id: 2, name: "Rushabh", username: "rk777", email: "rushabhsingh777@gmail.com", address: address, phone: "8888888888", website: "whatsapp.com", company: company)
        let employeeViewModel = EmployeeViewModel(employee: employeeModel)
        
        XCTAssertEqual(employeeViewModel.employeeCompleteAddress, "MG market Suite 007 Lachen 421503", "Address is correct")
    }
    
    func testInValidEmployeeAddress(){
        let address = Address(street: "", suite: "", city: "", zipcode: "")
        let company = Company(name: "Whatsapp", catchPhrase: "We respect privacy", bs: "Just kidding")
        let employeeModel = EmployeeModel(id: 2, name: "Rushabh", username: "rk777", email: "rushabhsingh777@gmail.com", address: address, phone: "8888888888", website: "whatsapp.com", company: company)
        let employeeViewModel = EmployeeViewModel(employee: employeeModel)
        XCTAssertEqual(employeeViewModel.employeeCompleteAddress, EmployeeConstant.notAvailable, "Address is not available")
    }


}
