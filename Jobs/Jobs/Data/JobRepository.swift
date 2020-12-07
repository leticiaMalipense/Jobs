//
//  JobRepository.swift
//  Jobs
//
//  Created by Leticia Malipense on 06/12/20.
//

import UIKit
import CoreData

protocol JobRepositoryErroDelegate: AnyObject {
    func showMessageErro() -> Void
}
class JobRepository {
    
    static func saveJob(jobModel: JobModel, delegate: JobRepositoryErroDelegate) -> Void {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let jobEntity = NSEntityDescription.insertNewObject(forEntityName: "Job", into: context)
        jobEntity.setValue(jobModel.id, forKey: "id")
        jobEntity.setValue(jobModel.name, forKey: "name")
        jobEntity.setValue(jobModel.city, forKey: "city")
        jobEntity.setValue(jobModel.email, forKey: "email")
        jobEntity.setValue(jobModel.qtd, forKey: "qtd")
        jobEntity.setValue(jobModel.salary, forKey: "salary")
        jobEntity.setValue(jobModel.type, forKey: "type")
        
        do {
            try context.save()
            print("Dados salvos com sucesso")
        } catch {
            print(self)
            delegate.showMessageErro()
        }
    }
    
    static func getAllJob(delegate: JobRepositoryErroDelegate) -> [JobModel] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Job")
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            let jobs = try context.fetch(request)
            var jobModels: [JobModel] = []
            if jobs.count > 0 {
                for jobEntity in jobs as! [NSManagedObject] {
                    let idEntity: String = jobEntity.value(forKey: "id") as! String
                    let nameEntity: String = jobEntity.value(forKey: "name") as! String
                    let qtdEntity: Int = jobEntity.value(forKey: "qtd") as! Int
                    let cityEntity: String = jobEntity.value(forKey: "city") as! String
                    let salaryEntity: Double = jobEntity.value(forKey: "salary") as! Double
                    let emailEntity: String = jobEntity.value(forKey: "email") as! String
                    let typeEntity: String = jobEntity.value(forKey: "type")
                        as! String
                    
                    jobModels.append(JobModel(id: idEntity, name: nameEntity, qtd: qtdEntity, city: cityEntity, salary: salaryEntity, email: emailEntity, type: typeEntity))
                }
            return jobModels
            } else {
                return []
            }
        } catch {
            print(self)
            delegate.showMessageErro()
        }
        
        return []
    }
    
    
    static func updateJob(jobModel: JobModel, delegate: JobRepositoryErroDelegate) -> Void {
       
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Job")
        fetchRequest.predicate = NSPredicate(format: "id = %@", jobModel.id)
        
        do {
            let results = try context.fetch(fetchRequest) as? [NSManagedObject]
            if results?.count != 0 {
                results![0].setValue(jobModel.name, forKey: "name")
                results![0].setValue(jobModel.city, forKey: "city")
                results![0].setValue(jobModel.email, forKey: "email")
                results![0].setValue(jobModel.qtd, forKey: "qtd")
                results![0].setValue(jobModel.salary, forKey: "salary")
                results![0].setValue(jobModel.type, forKey: "type")
            }
        } catch {
            delegate.showMessageErro()
        }

        do {
            try context.save()
            print("Dados alterados com sucesso")
            
        } catch {
            print(self)
            delegate.showMessageErro()
        }

    }
    
    static func deleteJob(id: String, delegate: JobRepositoryErroDelegate) -> Void {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Job")
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        
        
        do {
            let results = try context.fetch(fetchRequest) as? [NSManagedObject]
            if results?.count != 0 {
                context.delete(results![0])
            }
        } catch {
            delegate.showMessageErro()
        }

        do {
            try context.save()
            print("Dados excluidos com sucesso")
            
        } catch {
            print(self)
            delegate.showMessageErro()
        }

    }

}
