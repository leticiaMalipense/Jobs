//
//  JobsTableViewController.swift
//  Jobs
//
//  Created by Leticia Malipense on 03/12/20.
//

import UIKit

class JobsTableViewController: UITableViewController {
    var jobDetails:JobModel?
    var index: Int?

    var segueDetails = "segueDetails"
    var array: [JobModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        array = JobRepository.getAllJob(delegate: self)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: JobsTableViewCell.jobCell, for: indexPath) as? JobsTableViewCell else { return UITableViewCell() }
        cell.lblName.text = array[indexPath.row].name
        cell.lblCity.text = array[indexPath.row].city
        cell.lblSalary.text = "R$ " + String(array[indexPath.row].salary).currencyInputFormatting()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.index = indexPath.row
        self.jobDetails = array[indexPath.row]
        self.performSegue(withIdentifier: self.segueDetails, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.destination as? DetailsViewController else { return }
        controller.jobDetails = self.jobDetails
        controller.index = self.index
        controller.delegate = self
    }
}

extension JobsTableViewController: DetailsViewControllerDelegate {
    func deleteList(index: Int) {
        self.array.remove(at: index)
        self.tableView.reloadData()
    }
    
    func updateList(index: Int, jobDetails: JobModel) {
        self.array[index] = jobDetails
        self.tableView.reloadData()
    }
}

extension JobsTableViewController: JobRepositoryErroDelegate {
    func showMessageErro() {
        let alert = UIAlertController(title: "Erro", message: "Ocorreu um erro ao recuperar as vagas, por favor tente mais tarde", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension JobsTableViewController: ViewControllerDelegate {
    func reloadList(job: JobModel) {
        self.array.append(job)
        self.tableView.reloadData()
    }
}
