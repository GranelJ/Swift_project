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
    @IBOutlet weak var TpsPreplabel: UILabel!
    @IBOutlet weak var Agelabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let patient: Patient?
        do{
            let exist: Bool = try Patient.exist()
            if exist{
                do{
                    patient = try Patient.get()
                    NomLabel.text = patient?.nom
                    PrenomLabel.text = patient?.prenom
                    TpsPreplabel.text = patient?.temps_preparation.description
                    // formate la date en txt
                    let formatter = DateFormatter()
                    formatter.dateFormat = "dd/MM/YYYY"
                    let dateString = formatter.string(from: patient?.date_naissance as! Date)
                    Agelabel.text = dateString
                }catch{
                }
            }
        }catch{
            fatalError("Application Error")
        }
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
