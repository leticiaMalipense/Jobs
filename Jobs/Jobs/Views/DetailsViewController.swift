//
//  DetailsViewController.swift
//  Jobs
//
//  Created by Leticia Malipense on 03/12/20.
//

import UIKit

class DetailsViewController: UIViewController {
    var jobDetails:Job!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil);
    }

}
