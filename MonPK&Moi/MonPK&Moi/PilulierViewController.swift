//
//  PilulierViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 05/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class PilulierViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var priseMedicament : [String] = [] //changer string par Medicament lorsque type medicmanet cree
    @IBOutlet weak var PriseMedicamentTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.priseMedicament.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.PriseMedicamentTable.dequeueReusableCell(withIdentifier: "MedicamentCell", for: indexPath) as! MedicamentTableViewCell
        cell.period.text = self.priseMedicament[indexPath.row]
        cell.drug.text = self.priseMedicament[indexPath.row]
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
