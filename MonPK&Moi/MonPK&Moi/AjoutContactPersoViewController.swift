//
//  AjoutContactPersoViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 05/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class AjoutContactPersoViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Variable from the view
    
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var numLabel: UITextField!
    @IBOutlet weak var mailLabel: UITextField!
    @IBOutlet weak var firstNameLabel: UITextField!
    
    // MARK: - Function for the view
    
    /// Function used when the user press the validate button to add a personnal contact
    ///
    /// - Parameter sender: any
    @IBAction func validateButton(_ sender: Any) {
        let nom = lastNameLabel.text ?? ""
        let prenom = firstNameLabel.text ?? ""
        let num = numLabel.text ?? ""
        let mail = mailLabel.text ?? ""
        if (nom != "") && (prenom != "") && (num != "") && (mail != ""){
            Contact_perso(forEmail: mail, forNom: nom, forPrenom: prenom, forTelephone: num)
            performSegue(withIdentifier: "AddContactPerso", sender: self)
        }else{
            ManageErrorHelper.alertError(view: self, WithTitle: "Champ(s) manquant(s)", andMessage: "Veuillez remplir tous les champs du formulaire")
            return
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lastNameLabel.delegate = self
        self.numLabel.delegate = self
        self.mailLabel.delegate = self
        self.firstNameLabel.delegate = self
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
