//
//  PilulierViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 05/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class PilulierViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var traitements : [Traitement] = []
    @IBOutlet weak var PriseMedicamentTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do{
            try traitements = Traitement.getAll()
        }catch let error as NSError{
            ManageErrorHelper.alertError(view: self, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.traitements.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.PriseMedicamentTable.dequeueReusableCell(withIdentifier: "MedicamentCell", for: indexPath) as! MedicamentTableViewCell
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let dateString = formatter.string(from: self.traitements[indexPath.row].moment_de_prise)
        cell.period.text = dateString
        cell.drug.text = (self.traitements[indexPath.row].dao.traitement_medicament?.nom)! + " " + (self.traitements[indexPath.row].dao.traitement_medicament?.dosage)!
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle==UITableViewCellEditingStyle.delete){
            self.PriseMedicamentTable.beginUpdates()
            if(self.delete_traitement(traitementWithIndex: indexPath.row)){
                self.PriseMedicamentTable.deleteRows(at: [indexPath], with:UITableViewRowAnimation.automatic)
            }
            self.PriseMedicamentTable.endUpdates()
        }
    }

    
    @IBAction func unwindAfterAddingTraitement(segue: UIStoryboardSegue){
        do{
            try traitements = TraitementDAO.getAll()
            PriseMedicamentTable.reloadData()
        }catch let error as NSError{
            ManageErrorHelper.alertError(view: self, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
        }
    }
    
    // MARK: - Delete management
    func delete_traitement(traitementWithIndex index: Int) -> Bool{
        let traitement = self.traitements[index]
        traitement.delete()
        self.traitements.remove(at: index)
        return true
    }


}
