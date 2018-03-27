//
//  AjoutExerciceViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 05/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class AjoutExerciceViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Variable creation
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet var semaineSwitch: [UISwitch]!
    
    // MARK: - Function for the view
    
    /// Function used when the user press the validate button to add an exercice
    ///
    /// - Parameter sender: any
    @IBAction func validateButton(_ sender: Any) {
        self.saveNewExercice(withName: nameText.text, weekDays: semaineSwitch)
        self.performSegue(withIdentifier: "AddExercice", sender: self)
    }
    
    func saveNewExercice(withName name: String?, weekDays days: [UISwitch]){
        for nbDeLignes in 0...6 {
            if(days[nbDeLignes].isOn){
                let nbDeLignes64 = Int64(nbDeLignes)
                Exercice(forJour: nbDeLignes64, forLibelle: name!)
            }
        }
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
    
    // MARK: - Keyboard management for textfield
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
