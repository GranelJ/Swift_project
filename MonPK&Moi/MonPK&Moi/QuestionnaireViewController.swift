//
//  QuestionnaireViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 08/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class QuestionnaireViewController: UIViewController {

    // MARK: - Variable creation
    
    @IBOutlet weak var switchON: UISwitch!
    @IBOutlet weak var switchDYS: UISwitch!
    @IBOutlet weak var switchOFF: UISwitch!
    
    // MARK: - Function for the view
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// Function to turn off the others switch when the On switch in turned on
    ///
    /// - Parameter sender: any
    @IBAction func ActSwitchON(_ sender: Any) {
        switchDYS.setOn(false, animated: true)
        switchOFF.setOn(false, animated: true)
    }

    /// Function to turn off the others switch when the DYS switch in turned on
    ///
    /// - Parameter sender: any
    @IBAction func ActSwitchDYS(_ sender: Any) {
        switchON.setOn(false, animated: true)
        switchOFF.setOn(false, animated: true)
    }
    
    /// Function to turn off the others switch when the Off switch in turned on
    ///
    /// - Parameter sender: any
    @IBAction func ActSwitchOFF(_ sender: Any) {
        switchON.setOn(false, animated: true)
        switchDYS.setOn(false, animated: true)
    }
    
    /// Function used when the user press the validate button to add a test
    ///
    /// - Parameter sender: any
    @IBAction func validateButton(_ sender: Any) {
        let date_test = Date()
        let reponse: String
        if(switchON.isOn){
            reponse="ON"
        }else if(switchDYS.isOn){
            reponse="Dyskinesies"
        }else{
            reponse="OFF"
        }
        Test_motricite(forDate: date_test, forReponse: reponse, forSynthese: nil)//TODO
        self.navigationController?.popViewController(animated: true)
    }

}
