//
//  Job.swift
//  Jobs
//
//  Created by Leticia Malipense on 03/12/20.
//

import UIKit

class JobModel: Codable {
    var id: String
    var name: String
    var qtd: Int
    var city: String
    var salary: Double
    var email: String
    var type: String
    
    init(id: String, name: String, qtd: Int, city: String, salary: Double, email: String, type: String) {
        self.id = id
        self.name = name
        self.qtd = qtd
        self.city = city
        self.salary = salary
        self.email = email
        self.type = type
    }
}
