//
//  DetailsViewController.swift
//  Jobs
//
//  Created by Leticia Malipense on 03/12/20.
//

import UIKit

protocol DetailsViewControllerDelegate: AnyObject {
    func deleteList(index: Int) -> Void
    func updateList(index: Int, jobDetails:JobModel) -> Void
}
class DetailsViewController: UIViewController, JobRepositoryErroDelegate {
    func showMessageErro() {
        let alert = UIAlertController(title: "Erro", message: "Ocorreu um erro ao alterar o registro, por favor tente mais tarde", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    var jobDetails:JobModel!
    var index: Int!
    var delegate: DetailsViewControllerDelegate!

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtQtd: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtSalary: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtType: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.txtName.text = ""
        self.txtQtd.text = ""
        self.txtCity.text = ""
        self.txtSalary.text = ""
        self.txtEmail.text = ""
        self.txtType.text = ""
        txtSalary.addTarget(self, action: #selector(myTextFieldDidChange), for: .editingChanged)
        
        if let details = jobDetails {
            self.txtName.text = details.name
            self.txtQtd.text = String(details.qtd)
            self.txtCity.text = details.city
            self.txtSalary.text = String(details.salary).currencyInputFormatting()
            self.txtEmail.text = details.email
            self.txtType.text = details.type
        }
    }
    
    @objc func myTextFieldDidChange(_ textField: UITextField) {

        if let amountString = textField.text?.currencyInputFormatting() {
            textField.text = amountString
        }
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil);
    }
    
    @IBAction func btnSave(_ sender: Any) {
        self.jobDetails = JobModel(id: self.jobDetails.id, name: txtName.text!, qtd: Int(txtQtd.text!)!, city: txtCity.text!,
                                          salary: txtSalary.text!.currencyToDouble(), email: txtEmail.text!,
                                          type: txtType.text!)
        JobRepository.updateJob(jobModel: self.jobDetails, delegate: self)
        self.delegate.updateList(index: self.index, jobDetails: self.jobDetails)
        self.updateMessageSuccess()
    }
    
    @IBAction func btnDelete(_ sender: Any) {
        JobRepository.deleteJob(id: self.jobDetails.id, delegate: self)
        self.delegate.deleteList(index: self.index)
        deleteMessageSuccess()
    }
    
    func deleteMessageSuccess() {
        let alert = UIAlertController(title: "Sucesso", message: "Vaga excluida com sucesso", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {_ in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateMessageSuccess() {
        let alert = UIAlertController(title: "Sucesso", message: "Vaga alterada com sucesso", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {_ in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
