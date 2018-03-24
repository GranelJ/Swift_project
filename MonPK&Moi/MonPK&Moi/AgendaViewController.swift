//
//  AgendaViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 06/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class AgendaViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var rdvsTable: UITableView!
    var rdvs: [Rdv] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do{
            try rdvs=Rdv.getAll()
        }catch let error as NSError{
            ManageErrorHelper.alertError(view: self, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func unwindAfterAddingRDV(segue: UIStoryboardSegue){
        do{
            try rdvs = Rdv.getAll()
            rdvsTable.reloadData()
        }catch let error as NSError{
            ManageErrorHelper.alertError(view: self, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
        }
    }

    // MARK: - Table View Management
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.rdvsTable.dequeueReusableCell(withIdentifier: "RDVCell", for: indexPath) as! RdvTableViewCell
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM HH:mm"
        let dateString = formatter.string(from: self.rdvs[indexPath.row].date_rdv)
        cell.dateLabel.text = dateString
        cell.libelleLabel.text = self.rdvs[indexPath.row].libelle
        cell.medecinLabel.text = self.rdvs[indexPath.row].dao.rdv_medecin?.nom
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rdvs.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle==UITableViewCellEditingStyle.delete){
            self.rdvsTable.beginUpdates()
            if(self.delete_rdv(rdvWithIndex: indexPath.row)){
                self.rdvsTable.deleteRows(at: [indexPath], with:UITableViewRowAnimation.automatic)
            }
            self.rdvsTable.endUpdates()
        }
    }
    
    // MARK: - Delete management
    func delete_rdv(rdvWithIndex index: Int) -> Bool{
        let rdv = self.rdvs[index]
        rdv.delete()
        self.rdvs.remove(at: index)
        return true
    }
    
}

