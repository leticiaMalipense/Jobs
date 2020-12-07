//
//  CreateViewController.swift
//  Jobs
//
//  Created by Leticia Malipense on 03/12/20.
//

import UIKit

class CreateViewController: UIViewController {
    var delegate: CreateTableViewDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? CreateTableViewController
        controller?.delegate = self.delegate
    }
    
}
