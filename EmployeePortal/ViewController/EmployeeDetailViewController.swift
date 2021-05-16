//
//  EmployeeDetailViewController.swift
//  EmployeePortal
//
//  Created by Rushabh Singh on 15/05/21.
//

import UIKit

class EmployeeDetailViewController: UIViewController {
    
    var employeeDetail : EmployeeViewModel
    var delegate : HireButtonProtocol?
    @IBOutlet weak var hireButton: UIButton!
    @IBOutlet weak var scrollableContentView: UIView!
    
    init(employeeDetail : EmployeeViewModel) {
        self.employeeDetail = employeeDetail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addDetailView()
    }
    
    private func addDetailView(){
        let detailView = EmployeeDetailView()
        detailView.frame = CGRect(x: HORIZONTAL_PADDING, y: VERTICAL_PADDING, width: UIScreen.main.bounds.width - 2*HORIZONTAL_PADDING, height: DEFAULT_HEIGHT)
        detailView.employeeViewModel = self.employeeDetail
        //handle scrollable height constraint
        scrollableContentView.addSubview(detailView)
        hireButton.setTitle(employeeDetail.employeeStatus, for: .normal)
    }
    
    @IBAction func hireButtonClicked(_ sender: Any) {
        employeeDetail =  EmployeeHiringViewModel().getUpdatedEmployee(employee: employeeDetail)
        hireButton.setTitle(employeeDetail.employeeStatus, for: .normal)
        delegate?.updateHireStatus(id: employeeDetail.employeeId)
    }
}

