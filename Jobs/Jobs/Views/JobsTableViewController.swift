//
//  JobsTableViewController.swift
//  Jobs
//
//  Created by Leticia Malipense on 03/12/20.
//

import UIKit

class JobsTableViewController: UITableViewController {
    var segueDetails = "segueDetails"
    var array = [Job(name: "Analista de Sistemas", qtd: 3, city: "Matão", salary: 6000.20, description: "Cargo Nivel Junior", email: "teste@teste.com", type: "PJ"),Job(name: "Analista de Sistemas", qtd: 3, city: "Matão", salary: 6000.20, description: "Cargo Nivel Junior", email: "teste@teste.com", type: "PJ")]

    override func viewDidLoad() {
        super.viewDidLoad()
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
        cell.lblSalary.text = "R$" + String(format: "%d", array[indexPath.row].salary)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: self.segueDetails, sender: array[indexPath.row])
    }
 
}
