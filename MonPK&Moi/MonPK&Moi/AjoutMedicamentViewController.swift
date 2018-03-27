//
//  AjoutMedicamentViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 05/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class AjoutMedicamentViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Variable creation
    
    @IBOutlet weak var nomTF: UITextField!
    @IBOutlet weak var descTF: UITextField!
    @IBOutlet weak var dosageTF: UITextField!
    
    // MARK: - Function for the view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.descTF.delegate = self
        self.dosageTF.delegate = self
        self.nomTF.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// Function used when the user press the validate button to create a new medicament
    ///
    /// - Parameter sender: any
    @IBAction func ValidateButton(_ sender: Any) {
        let nom = self.nomTF.text ?? ""
        let desc = self.descTF.text ?? ""
        let dosage = self.dosageTF.text ?? ""
        if (nom != "") && (desc != "") && (dosage != ""){
            Medicament(forDesc: desc, forDosage: dosage, forNom: nom)
            self.navigationController?.popViewController(animated: true)
        }else{
            ManageErrorHelper.alertError(view: self, WithTitle: "Champ(s) manquant(s)", andMessage: "Veuillez remplir tous les champs du formulaire")
            return
        }
        
    }

    // MARK: - Keyboard management for textfield
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
