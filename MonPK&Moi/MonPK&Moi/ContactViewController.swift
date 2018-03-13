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
    
    @IBOutlet weak var medecinsTable: UITableView!
    
    var medecins : [Medecin] = []
    
    @IBAction func addButton(_ sender: Any) {
        let alert = UIAlertController(title: "Nouveau Nom", message: "Ajouter un nom", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Ajouter", style: .default){
            [unowned self] action in
            guard let textField = alert.textFields?.first,
                let nameToSave = textField.text else{
                    return
            }
            self.saveNewMedecin(withName: nameToSave)
            self.medecinsTable.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Annuler", style: .default)
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated:true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            self.alertError(errorMsg: "Could not load data", userInfo: "reason unknow")
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
    
    func saveNewMedecin(withName nom: String?){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            self.alertError(errorMsg: "Le contact ne peut être ajouté", userInfo: "raison inconnu")
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let medecin = Medecin(context: context)
        medecin.nom=nom
        do{
            try context.save()
            self.medecins.append(medecin)
        }
        catch let error as NSError{
            self.alertError(errorMsg: "\(error)", userInfo: "\(error.userInfo)")
            return
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.medecinsTable.dequeueReusableCell(withIdentifier: "medecinCell", for: indexPath) as! MedecinTableViewCell
        cell.lastNameLabel.text = self.medecins[indexPath.row].nom
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.medecins.count
    }

}
