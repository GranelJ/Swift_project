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
    
    @IBOutlet weak var medecinsTable: UITableView!
    
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
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            self.alertError(errorMsg: "Could not load data", userInfo: "reason unknown")
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let request : NSFetchRequest<Medecin> = Medecin.fetchRequest()
        do{
            try self.medecins = context.fetch(request)
        }
        catch let error as NSError{
            self.alertError(errorMsg: "\(error)", userInfo: "\(error.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertError(errorMsg error: String, userInfo user: String=""){
        let alert=UIAlertController(title: error, message: user, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(cancelAction)
        present(alert,animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.medecinsTable.dequeueReusableCell(withIdentifier: "medecinCell", for: indexPath) as! MedecinTableViewCell
        cell.lastNameLabel.text = self.medecins[indexPath.row].nom
        cell.firstNameLabel.text = self.medecins[indexPath.row].prenom
        cell.professionLabel.text = self.medecins[indexPath.row].profession
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.medecins.count
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
