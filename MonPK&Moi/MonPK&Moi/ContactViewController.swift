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
    
    @IBOutlet weak var medecinsTable: UITableView!
    @IBOutlet weak var contactsTable: UITableView!
    
    @IBOutlet weak var NomLabel: UILabel!
    @IBOutlet weak var PrenomLabel: UILabel!
    @IBOutlet weak var TpsPreplabel: UILabel!
    @IBOutlet weak var Agelabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let patient: Patient?
        do{
            let exist: Bool = try Patient.exist()
            if exist{
                do{
                    patient = try Patient.get()
                    NomLabel.text = patient?.nom
                    PrenomLabel.text = patient?.prenom
                    TpsPreplabel.text = patient?.temps_preparation.description
                    let formatter = DateFormatter()
                    formatter.dateFormat = "dd/MM/YYYY"
                    let dateString = formatter.string(from: patient?.date_naissance as! Date)
                    Agelabel.text = dateString
                }catch{
                }
            }
        }catch{
            fatalError("Application Error")
        }
        
        let request : NSFetchRequest<Medecin> = Medecin.fetchRequest()
        do{
            try self.medecins = ManageCoreData.context.fetch(request)
        }
        catch let error as NSError{
            ManageErrorHelper.alertError(view: self, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
        }
        
        let request2 : NSFetchRequest<Contact_perso> = Contact_perso.fetchRequest()
        do{
            try self.contacts = ManageCoreData.context.fetch(request2)
        }
        catch let error as NSError{
            ManageErrorHelper.alertError(view: self, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
            let cellC = self.medecinsTable.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
