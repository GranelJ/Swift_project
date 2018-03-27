//
//  AjoutContactMedicalViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 05/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit
import CoreData

class AjoutContactMedicalViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textNom: UITextField!
    @IBOutlet weak var textNum: UITextField!
    @IBOutlet weak var textMail: UITextField!
    @IBOutlet weak var textPrenom: UITextField!
    @IBOutlet weak var textMetier: UITextField!
    @IBOutlet weak var textLieu: UITextField!
    
    @IBAction func ValidateButton(_ sender: Any) {
        let nom = textNom.text ?? ""
        let num = textNum.text ?? ""
        let mail = textMail.text ?? ""
        let prenom = textPrenom.text ?? ""
        let metier = textMetier.text ?? ""
        let lieu = textLieu.text ?? ""
        if (nom != "") && (num != "") && (mail != "") && (prenom != "") && (metier != "") && (lieu != "") {
            Medecin(forEmail: mail, forLieu: lieu, forNom: nom, forPrenom: prenom, forProfession: metier, forTelephone: num)
            performSegue(withIdentifier: "AddContactMedical", sender: self)
        }else{
            ManageErrorHelper.alertError(view: self, WithTitle: "Champ(s) manquant(s)", andMessage: "Veuillez remplir tous les champs du formulaire")
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textLieu.delegate = self
        self.textMail.delegate = self
        self.textMetier.delegate = self
        self.textNom.delegate = self
        self.textNum.delegate = self
        self.textPrenom.delegate = self
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
