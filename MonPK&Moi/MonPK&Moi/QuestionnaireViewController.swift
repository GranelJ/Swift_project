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
        let test = Test_motriciteDAO(context: ManageCoreData.context)
        test.date_test=Date() as NSDate
        if(switchON.isOn){
            test.reponse="ON"
        }else if(switchDYS.isOn){
            test.reponse="Dyskinesies"
        }else if(switchOFF.isOn){
            test.reponse="OFF"
        }
        do{
            try ManageCoreData.context.save()
        }
        catch let error as NSError{
            ManageErrorHelper.alertError(view: self, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
            return
        }
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
