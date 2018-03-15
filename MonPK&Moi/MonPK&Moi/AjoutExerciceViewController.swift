//
//  AjoutExerciceViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 05/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class AjoutExerciceViewController: UIViewController {

    @IBOutlet weak var periodText: UITextField!
    @IBOutlet weak var dateText: UIDatePicker!
    @IBOutlet weak var nameText: UITextField!
    
    
    @IBAction func validateButton(_ sender: Any) {
        self.saveNewExercice(withName: nameText.text, withDate: dateText.date, withPeriod: periodText.text)
        self.navigationController?.popViewController(animated: true)
    }
    
    func saveNewExercice(withName name: String?,withDate date: Date?,withPeriod period: String?){
        let exercice = Exercice(context: ManageCoreData.context)
        exercice.libelle=name
        exercice.date_debut=date! as NSDate
        exercice.periodicite=period
        do{
            try ManageCoreData.context.save()
        }
        catch let error as NSError{
            ManageErrorHelper.alertError(view: self, error: error)
            return
        }
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
