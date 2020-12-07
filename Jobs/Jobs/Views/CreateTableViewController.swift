//
//  CreateTableViewController.swift
//  Jobs
//
//  Created by Leticia Malipense on 03/12/20.
//

import UIKit

protocol CreateTableViewDelegate: AnyObject {
    func reloadListJob(job: JobModel) -> Void
}
class CreateTableViewController: UITableViewController {
    
    @IBOutlet weak var lblName: UITextField!
    @IBOutlet weak var lblQtd: UITextField!
    @IBOutlet weak var lblCity: UITextField!
    @IBOutlet weak var lblSalary: UITextField!
    @IBOutlet weak var lblEmail: UITextField!
    @IBOutlet weak var type: UISwitch!
    
    var delegate: CreateTableViewDelegate!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        lblSalary.addTarget(self, action: #selector(myTextFieldDidChange), for: .editingChanged)
    }
    
    @objc func myTextFieldDidChange(_ textField: UITextField) {

        if let amountString = textField.text?.currencyInputFormatting() {
            textField.text = amountString
        }
    }
    
    @IBAction func btnSave(_ sender: Any) {
        if(self.validadeFields()) {
            let jobModel: JobModel = JobModel(id: UUID().uuidString, name: lblName.text!, qtd: Int(lblQtd.text!)!, city: lblCity.text!,
                                              salary: lblSalary.text!.currencyToDouble(), email: lblEmail.text!,
                                              type: type.isOn ? "PJ" : "CLT")
            JobRepository.saveJob(jobModel: jobModel, delegate: self)
            self.delegate.reloadListJob(job: jobModel)
            self.messageSucess()
        } else {
            self.messageErro()
        }
        
    }
    
    func validadeFields() -> Bool {

        if(self.lblName.text == "" || self.lblQtd.text == "" || self.lblCity.text == "" ||
           self.lblSalary.text == "" || self.lblEmail.text == "" ) {
            return false
        }
        return true
    }
    
    func messageSucess() -> Void {
        let alert = UIAlertController(title: "Sucesso", message: "Vaga insertida com sucesso", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {_ in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func messageErro() -> Void {
        let alert = UIAlertController(title: "Erro", message: "Preencha todos os campos", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension CreateTableViewController: JobRepositoryErroDelegate {
    
    func showMessageErro() {
        let alert = UIAlertController(title: "Erro", message: "Ocorreu um erro ao inserir a vaga, por favor tente mais tarde", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
