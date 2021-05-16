//
//  ViewController.swift
//  EmployeePortal
//
//  Created by Rushabh Singh on 15/05/21.
//

import UIKit

class EmployeeListViewController: UIViewController {
    @IBOutlet weak var employeesTableView: UITableView!
    
    var employeesList : [EmployeeViewModel]?
    let EMPLOYEE_CELL_IDENTIFIER = "EmployeeCellIdentifier"
    let EMPLOYEE_TABLE_VIEW_CELL = "EmployeeTableViewCell"
    let NAVIGATION_TITLE = "Employee List"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = NAVIGATION_TITLE
        setupTableView()
        downloadEmployeesList()
    }
    
    private func setupTableView() {
        employeesTableView.delegate = self
        employeesTableView.dataSource = self
        let employeeNib = UINib(nibName: EMPLOYEE_TABLE_VIEW_CELL, bundle: nil)
        employeesTableView.register(employeeNib, forCellReuseIdentifier: EMPLOYEE_CELL_IDENTIFIER)
    }
    
    private func downloadEmployeesList(){
        let urlString = ApiConstants.EmployeeListUrl
        EmployeeResourceViewModel().getEmployeesList(urlString: urlString) { (employees) in
            DispatchQueue.main.async {
                self.employeesList = employees
                self.employeesTableView.reloadData()
            }
        }
    }
    
}

