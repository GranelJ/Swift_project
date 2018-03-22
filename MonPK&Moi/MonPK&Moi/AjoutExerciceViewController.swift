//
//  AjoutExerciceViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 05/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class AjoutExerciceViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet var semaineSwitch: [UISwitch]!
    
    
    @IBAction func validateButton(_ sender: Any) {
        self.saveNewExercice(withName: nameText.text, weekDays: semaineSwitch)
    }
    
    func saveNewExercice(withName name: String?, weekDays days: [UISwitch]){
        
        for nbDeLignes in 0...6 {
            if(days[nbDeLignes].isOn){
                let exercice = ExerciceDAO(context: ManageCoreData.context)
                exercice.libelle=name
                exercice.jour=Int64(nbDeLignes)
                do{
                    try ManageCoreData.context.save()
                }
                catch let error as NSError{
                    ManageErrorHelper.alertError(view: self, error: error)
                    return
                }
            }
        }
        self.performSegue(withIdentifier: "AddExercice", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameText.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
