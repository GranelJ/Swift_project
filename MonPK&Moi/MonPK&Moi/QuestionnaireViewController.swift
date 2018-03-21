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
        popAlert(view: self, WithTitle: "test de motricite valide")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func popAlert(view : UIViewController, WithTitle title: String, andMessage msg: String = ""){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .default){ action -> Void in
            //Redirect to new viewcontroler
            let newVC = self.storyboard?.instantiateViewController(withIdentifier: "CoachViewController") as? CoachViewController
            self.navigationController?.pushViewController(newVC!,animated: true)}
            alert.addAction(cancelAction)
            view.present(alert,animated: true)
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
