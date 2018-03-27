//
//  SyntheseViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 26/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class SyntheseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var syntheseTable: UITableView!
    var syntheses: [Synthese] = []
    var valueToPass:SyntheseTableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            try self.syntheses = Synthese.getAll()
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
    
    // MARK: - Table View Management
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.syntheseTable.dequeueReusableCell(withIdentifier: "SyntheseCell", for: indexPath) as! SyntheseTableViewCell
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM HH:mm"
        let dateString = formatter.string(from: (self.syntheses[indexPath.row].dao.synthese_rdv?.date_rdv)! as Date)
        cell.dateSynthese.text = dateString
        cell.date_rdv = (self.syntheses[indexPath.row].dao.synthese_rdv?.date_rdv as! Date)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.syntheses.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle==UITableViewCellEditingStyle.delete){
            self.syntheseTable.beginUpdates()
            if(self.delete_synthese(contactWithIndex: indexPath.row)){
                self.syntheseTable.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            }
            self.syntheseTable.endUpdates()
        }
    }
    
    func delete_synthese(contactWithIndex index: Int) -> Bool{
        let synthese = self.syntheses[index]
        synthese.delete()
        self.syntheses.remove(at: index)
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if (segue.identifier == "synthese") {
            // Get Cell Label
            let indexPath = self.syntheseTable.indexPathForSelectedRow!
            let currentCell = self.syntheseTable.cellForRow(at: indexPath)! as! SyntheseTableViewCell
            
            valueToPass = currentCell
            // initialize new view controller and cast it as your view controller
            let viewController = segue.destination as! SyntheseJourViewController
            // your new view controller should have property that will store passed value
            viewController.passedvalue = valueToPass
        }
    }

}
