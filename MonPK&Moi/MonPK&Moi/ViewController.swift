//
//  ViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 28/02/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var priseMedicament : [String] = [] //changer string par Medicament lorsque type medicmanet cree
    

    @IBOutlet weak var PriseMedicamentTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

}

