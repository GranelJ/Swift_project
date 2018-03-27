//
//  CoachViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 05/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

class CoachViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Variable creation
    
    var exercices : [Exercice] = []
    
    var nbJour: Int64 = -1
    
    @IBOutlet weak var exercicesTable: UITableView!
    
    // MARK: - TableView Management
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = self.exercicesTable.dequeueReusableCell(withIdentifier: "ExerciceCell", for: indexPath) as! ExerciceTableViewCell
        cell.nomLabel.text = self.exercices[indexPath.row].libelle
        if(self.exercices[indexPath.row].jour>nbJour){
            nbJour=self.exercices[indexPath.row].jour
            cell.jourLabel.text = String(self.exercices[indexPath.row].jour)
            switch nbJour {
            case 0:
                cell.jourLabel.text = "Lundi : "
            case 1:
                cell.jourLabel.text = "Mardi : "
            case 2:
                cell.jourLabel.text = "Mercredi : "
            case 3:
                cell.jourLabel.text = "Jeudi : "
            case 4:
                cell.jourLabel.text = "Vendredi : "
            case 5:
                cell.jourLabel.text = "Samedi : "
            case 6:
                cell.jourLabel.text = "Dimanche : "
            default:
                cell.jourLabel.text = " "
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.exercices.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            try self.exercices = Exercice.getAllOrdered()
        }
        catch let error as NSError{
            ManageErrorHelper.alertError(view: self, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle==UITableViewCellEditingStyle.delete){
            self.exercicesTable.beginUpdates()
            if(self.delete_exercice(contactWithIndex: indexPath.row)){
                self.exercicesTable.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            }
            self.exercicesTable.endUpdates()
        }
    }
    
    // MARK: - Delete management
    
    /// Function to delete an exercice from the table view
    ///
    /// - Parameter index: the index corresponding to the position of the exercice to delete in the liste
    /// - Returns: returns true
    func delete_exercice(contactWithIndex index: Int) -> Bool{
        let exercice = self.exercices[index]
        exercice.delete()
        self.exercices.remove(at: index)
        return true
    }
    
    // MARK: - Tableview refreshment
    
    /// Fucntion executed after adding an exercice from the form to refresh the tableview
    ///
    /// - Parameter segue: the segue that lead to this page from the from
    @IBAction func unwindAfterAddExercice(segue: UIStoryboardSegue){
        do{
            try exercices = Exercice.getAllOrdered()
            exercicesTable.reloadData()
        }catch let error as NSError{
            ManageErrorHelper.alertError(view: self, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
        }
    }
    
}
