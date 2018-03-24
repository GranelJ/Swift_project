//
//  ContactViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 05/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit
import CoreData

class ContactViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var medecins : [Medecin] = []
    var contacts : [Contact_perso] = []
    var patient : Patient?
    
    @IBOutlet weak var medecinsTable: UITableView!
    @IBOutlet weak var contactsTable: UITableView!
    
    @IBOutlet weak var NomLabel: UILabel!
    @IBOutlet weak var PrenomLabel: UILabel!
    @IBOutlet weak var TpsPreplabel: UILabel!
    @IBOutlet weak var Agelabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        do{
            patient = try Patient.get()
            NomLabel.text = patient?.nom
            PrenomLabel.text = patient?.prenom
            TpsPreplabel.text = patient?.temps_preparation.description
            // formate la date en txt
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/YYYY"
            let dateString = formatter.string(from: patient?.date_naissance as! Date)
            Agelabel.text = dateString
        }catch let error as NSError{
            ManageErrorHelper.alertError(view: self, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
        }
        
        //Request to get Contacts
        do{
            try self.medecins = Medecin.getAll()
        }
        catch let error as NSError{
            ManageErrorHelper.alertError(view: self, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
        }
        
        do{
            try self.contacts = Contact_perso.getAll()
        }
        catch let error as NSError{
            ManageErrorHelper.alertError(view: self, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //refresh medecinsTable
    @IBAction func unwindAfterAddContactMedical(segue: UIStoryboardSegue){
        do{
            try self.medecins = MedecinDAO.getAll()
            medecinsTable.reloadData()
        }catch let error as NSError{
            ManageErrorHelper.alertError(view: self, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
        }
    }
    
    //refresh contactsTable
    @IBAction func unwindAfterAddContactPerso(segue: UIStoryboardSegue){
        do{
            try self.contacts = Contact_persoDAO.getAll()
            contactsTable.reloadData()
        }catch let error as NSError{
            ManageErrorHelper.alertError(view: self, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
        }
    }
    
    //refresh personal info
    @IBAction func unwindAfterEditInfoPerso(segue: UIStoryboardSegue){
        do{
            patient = try PatientDAO.get()
            NomLabel.text = patient?.nom
            PrenomLabel.text = patient?.prenom
            TpsPreplabel.text = patient?.temps_preparation.description
            // formate la date en txt
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/YYYY"
            let dateString = formatter.string(from: patient?.date_naissance as! Date)
            Agelabel.text = dateString
        }catch let error as NSError{
            ManageErrorHelper.alertError(view: self, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
        }
    }

    // MARK: - Table View Management
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        if(tableView == self.medecinsTable){
        
            let cellM = self.medecinsTable.dequeueReusableCell(withIdentifier: "medecinCell", for: indexPath) as! MedecinTableViewCell
            cellM.lastNameLabel.text = self.medecins[indexPath.row].nom
            cellM.firstNameLabel.text = self.medecins[indexPath.row].prenom
            cellM.professionLabel.text = self.medecins[indexPath.row].profession
            
            return cellM
        }
        if(tableView == self.contactsTable){
            let cellC = self.contactsTable.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
            cellC.contactLastName.text = self.contacts[indexPath.row].nom
            cellC.contactFirstName.text = self.contacts[indexPath.row].prenom
            cellC.contactNum.text = self.contacts[indexPath.row].telephone
            
            return cellC
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count: Int?
        
        if(tableView == self.medecinsTable){
            count = self.medecins.count
        }
        if(tableView == self.contactsTable){
            count = self.contacts.count
        }
        return count!
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(tableView == self.contactsTable){
            if (editingStyle==UITableViewCellEditingStyle.delete){
                self.contactsTable.beginUpdates()
                if(self.delete_contact(contactWithIndex: indexPath.row)){
                    self.contactsTable.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
                }
                self.contactsTable.endUpdates()
            }
        }
        if(tableView == self.medecinsTable){
            if (editingStyle==UITableViewCellEditingStyle.delete){
                self.medecinsTable.beginUpdates()
                if(self.delete_medecin(contactWithIndex: indexPath.row)){
                    self.medecinsTable.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
                }
                self.medecinsTable.endUpdates()
            }
        }
    }
    
    // MARK: - Delete management
    func delete_contact(contactWithIndex index: Int) -> Bool{
        let contact = self.contacts[index]
        contact.delete()
        self.contacts.remove(at: index)
        return true
 
    }

    func delete_medecin(contactWithIndex index: Int) -> Bool{
        let medecin = self.medecins[index]
        medecin.delete()
        self.medecins.remove(at: index)
        return true

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
