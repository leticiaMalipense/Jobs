//
//  JobsTableViewCell.swift
//  Jobs
//
//  Created by Leticia Malipense on 03/12/20.
//

import UIKit

class JobsTableViewCell: UITableViewCell {
    static let jobCell = "jobCell"

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblSalary: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
