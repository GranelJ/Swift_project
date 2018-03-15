//
//  CoachViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 05/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class CoachViewController: UIViewController {

    var exercices : [Exercice] = []
    
    @IBOutlet weak var exercicesTable: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = self.exercicesTable.dequeueReusableCell(withIdentifier: "ExerciceCell", for: indexPath) as! ExerciceTableViewCell
        cell.nomLabel.text = self.exercices[indexPath.row].libelle
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YYYY"
        let dateString = formatter.string(from: self.exercices[indexPath.row].date_debut as! Date)
        cell.heureLabel.text = dateString
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.exercices.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
