//
//  EmployeeDetailView.swift
//  EmployeePortal
//
//  Created by Rushabh Singh on 15/05/21.
//

import Foundation
import UIKit
class EmployeeDetailView: UIView {
    
    @IBOutlet weak var contactNumber: UILabel!
    @IBOutlet weak var companyTagline: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var employeeName: UILabel!
    var employeeId : Int = 0
    var contentView : UIView!
    
    var employeeViewModel : EmployeeViewModel!{
        didSet{
            employeeName.text = employeeViewModel.employeeName
            userName.text = employeeViewModel.employeeUserName
            contactNumber.text = employeeViewModel.employeeContact
            companyName.text = employeeViewModel.employeeCompany
            companyTagline.text = employeeViewModel.employeeCompanyTagline
            address.text = employeeViewModel.employeeCompleteAddress
            employeeId = employeeViewModel.employeeId
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    private func setUpView() {
        contentView = loadViewFromNib()
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    private func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
}
