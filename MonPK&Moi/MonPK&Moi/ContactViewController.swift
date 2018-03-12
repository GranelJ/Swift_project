//
//  ContactViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 05/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit
import CoreData

class ContactViewController: UIViewController {

    @IBOutlet weak var NomLabel: UILabel!
    @IBOutlet weak var PrenomLabel: UILabel!
    @IBOutlet weak var AgeLabel: UILabel!
    @IBOutlet weak var TpsPrepLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var patient : [Patient] = []
        
        guard let nom = patient[0].nom else{
            return
        }
        NomLabel.text = nom
        //PrenomLabel.text = patient[0].prenom
        //TpsPrepLabel.text = patient[0].temps_preparation.description
        guard let date_naissance = patient[0].date_naissance else{
            return
        }
        //let age = NSDate.init() - date_naissance
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
