//
//  EmployeeTableViewCell.swift
//  EmployeePortal
//
//  Created by Rushabh Singh on 15/05/21.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var employeeName: UILabel!
    @IBOutlet weak var hireButton: UIButton!
    @IBOutlet weak var contactDetail: UILabel!
    @IBOutlet weak var emailId: UILabel!
    @IBOutlet weak var companyName: UILabel!
    var delegate : HireButtonProtocol?
    var employeeId : Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var employeeViewModel : EmployeeViewModel!{
        didSet{
            employeeName.text = employeeViewModel.employeeName
            contactDetail.text = employeeViewModel.employeeContact
            companyName.text = employeeViewModel.employeeCompany
            emailId.text = employeeViewModel.employeeEmailId
            employeeId = employeeViewModel.employeeId
            hireButton.setTitle(employeeViewModel.employeeStatus, for: .normal)
        }
    }
    
    @IBAction func hireButtonClicked(_ sender: Any) {
        delegate?.updateHireStatus(id: employeeId)
    }
}
