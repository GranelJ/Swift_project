//
//  CoachViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 05/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit
import CoreData

class CoachViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var exercices : [Exercice] = []
    
    @IBOutlet weak var exercicesTable: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = self.exercicesTable.dequeueReusableCell(withIdentifier: "ExerciceCell", for: indexPath) as! ExerciceTableViewCell
        cell.nomLabel.text = self.exercices[indexPath.row].libelle
        cell.jourLabel.text = String(self.exercices[indexPath.row].jour)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.exercices.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let request : NSFetchRequest<Exercice> = Exercice.fetchRequest()
        do{
            try self.exercices = ManageCoreData.context.fetch(request)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
