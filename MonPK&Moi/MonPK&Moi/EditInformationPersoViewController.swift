//
//  EditInformationPersoViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 05/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit
import CoreData

class EditInformationPersoViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var NomTF: UITextField!
    @IBOutlet weak var PrenomTF: UITextField!
    @IBOutlet weak var DateNaissanceDP: UIDatePicker!
    @IBOutlet weak var TpsPrepTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.NomTF.delegate = self
        self.PrenomTF.delegate = self
        self.TpsPrepTF.delegate = self
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
    @IBAction func unwindToContactListAfterSavingNewPerson(_ sender: Any) {
        let nom = NomTF.text ?? ""
        let prenom = PrenomTF.text ?? ""
        let tpsPrep = Int64(TpsPrepTF.text!)!
        let dateNaissance = DateNaissanceDP.date
        do{
            let exist = try Patient.get()
            if (exist != nil){
                self.editPatient(nom: nom, prenom: prenom, dateNaissance: dateNaissance, TpsPrep: tpsPrep)
            }else{
                Patient(forDate: dateNaissance, forNom: nom, forPrenom: prenom, forTempsPreparation: tpsPrep)
            }
        }catch{
            
        }
        performSegue(withIdentifier: "EditInfoPerso", sender: self)
    }
    
    // MARK: - helper methods
    func editPatient(nom: String, prenom: String, dateNaissance: Date, TpsPrep: Int64){
        //create Patient managedObj
        
        do{
            let patient = try Patient.get()
            patient?.nom = nom
            patient?.prenom = prenom
            patient?.temps_preparation = TpsPrep
            patient?.date_naissance = dateNaissance
        }catch let error as NSError{
            ManageErrorHelper.alertError(view: self, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
        }
        do{
            try ManageCoreData.context.save()
        }
        catch let error as NSError{
        ManageErrorHelper.alertError(view: self, error: error)
            return
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
