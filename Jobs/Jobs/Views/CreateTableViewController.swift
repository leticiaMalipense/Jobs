//
//  CreateTableViewController.swift
//  Jobs
//
//  Created by Leticia Malipense on 03/12/20.
//

import UIKit

class CreateTableViewController: UITableViewController {
    
    @IBOutlet weak var lblName: UITextField!
    @IBOutlet weak var lblQtd: UITextField!
    @IBOutlet weak var lblCity: UITextField!
    @IBOutlet weak var lblSalary: UITextField!
    @IBOutlet weak var lblDescription: UITextField!
    @IBOutlet weak var lblEmail: UITextField!
    @IBOutlet weak var type: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnSave(_ sender: Any) {
    }
    

}
