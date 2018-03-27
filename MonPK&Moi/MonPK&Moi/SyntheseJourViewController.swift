//
//  SyntheseJourViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 26/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class SyntheseJourViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    var passedvalue: SyntheseTableViewCell!
    @IBOutlet weak var jourTable: UITableView!
    var tests: [Test_motricite] = []
    var p: Int!
    
    @IBAction func switchDay(_ sender: UISegmentedControl) {
        p = sender.selectedSegmentIndex
        do{
            try tests = Test_motricite.getAllDiffDay(diff: 5-p, date: (passedvalue.date_rdv)!)
        }catch{
            
        }
        jourTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        p = 0
        do{
            try tests = Test_motricite.getAllDiffDay(diff: 5-p, date: (passedvalue.date_rdv)!)
        }catch{
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.jourTable.dequeueReusableCell(withIdentifier: "hourCell", for: indexPath) as! JourTableViewCell
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let dateString = formatter.string(from: self.tests[indexPath.row].date_test)
        cell.heureLabel.text = dateString
        cell.etatLabel.text = tests[indexPath.row].reponse
        if(tests[indexPath.row].reponse == "ON"){
            cell.etatLabel.backgroundColor = UIColor.green
        }else if(tests[indexPath.row].reponse == "Dyskinesies"){
            cell.etatLabel.backgroundColor = UIColor.yellow
        }else{
            cell.etatLabel.backgroundColor = UIColor.red
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tests.count
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
