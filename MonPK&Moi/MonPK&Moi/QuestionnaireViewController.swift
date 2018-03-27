//
//  QuestionnaireViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 08/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class QuestionnaireViewController: UIViewController {

    @IBOutlet weak var switchON: UISwitch!
    @IBOutlet weak var switchDYS: UISwitch!
    @IBOutlet weak var switchOFF: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ActSwitchON(_ sender: Any) {
        switchDYS.setOn(false, animated: true)
        switchOFF.setOn(false, animated: true)
    }

    @IBAction func ActSwitchDYS(_ sender: Any) {
        switchON.setOn(false, animated: true)
        switchOFF.setOn(false, animated: true)
    }
    
    @IBAction func ActSwitchOFF(_ sender: Any) {
        switchON.setOn(false, animated: true)
        switchDYS.setOn(false, animated: true)
    }
    
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
