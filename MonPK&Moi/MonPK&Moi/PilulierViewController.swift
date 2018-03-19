//
//  PilulierViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 05/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class PilulierViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var traitement : [TraitementDAO] = [] //changer string par Medicament lorsque type medicament cree
    @IBOutlet weak var PriseMedicamentTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do{
            try traitement = TraitementDAO.getAll()
        }catch{
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.traitement.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO: Faire ajout dans tableview
        let cell = self.PriseMedicamentTable.dequeueReusableCell(withIdentifier: "MedicamentCell", for: indexPath) as! MedicamentTableViewCell
        cell.period.text = self.traitement[indexPath.row].moment_de_prise
        cell.drug.text = (self.traitement[indexPath.row].traitement_medicament?.nom)! + " " + (self.traitement[indexPath.row].traitement_medicament?.dosage)!
        return cell
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
