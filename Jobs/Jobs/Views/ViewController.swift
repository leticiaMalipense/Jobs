//
//  ViewController.swift
//  Jobs
//
//  Created by Leticia Malipense on 28/11/20.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func reloadList(job: JobModel)
}
class ViewController: UIViewController {
    private let segueCreate = "segueCreate"
    private let segueList = "segueList"
    var job: JobModel?
    var delegate: ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.job = nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.segueCreate {
            let controller = segue.destination as? CreateViewController
            controller?.delegate = self
        } else if segue.identifier == self.segueList {
            let controller = segue.destination as? JobsTableViewController
            self.delegate = controller
        }
    }

}

extension ViewController: CreateTableViewDelegate {
    func reloadListJob(job: JobModel) {
        self.delegate?.reloadList(job: job)
    }
}
