//
//  Job.swift
//  Jobs
//
//  Created by Leticia Malipense on 03/12/20.
//

import UIKit

class Job: Codable {
    var name: String
    var qtd: Int
    var city: String
    var salary: Double
    var description: String
    var email: String
    var type: String
    
    init(name: String, qtd: Int, city: String, salary: Double, description: String, email: String, type: String) {
        self.name = name
        self.qtd = qtd
        self.city = city
        self.salary = salary
        self.description = description
        self.email = email
        self.type = type
    }
}
