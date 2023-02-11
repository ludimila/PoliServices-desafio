//
//  SelectDateViewController.swift
//  PoliServices
//
//  Created by Rodrigo Policante Martins on 01/12/22.
//

import Foundation
import UIKit

class SelectServiceDateViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var salvar: UIBarButtonItem!
    
    var serviceName: String?
    var viewModel = SelectServiceDateViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        datePicker.minimumDate = Date()
        datePicker.date = viewModel.selectDate()
    }
    
    @IBAction func createNewService(_ sender: Any) {
        let date = datePicker.date.timeIntervalSince1970
        viewModel.saveNewService(with: serviceName, and: date)
        dismiss(animated: true)
    }
}
