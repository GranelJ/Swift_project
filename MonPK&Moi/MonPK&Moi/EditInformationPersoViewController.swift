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
    func saveNewPatient(nom: String, prenom: String, dateNaissance: NSDate, TpsPrep: Int64){
        //first get context
        guard let context = self.getContext(errorMsg: "Save failed") else {
            return
        }
        //create Patient managedObj
        let patient = Patient(context: context)
        patient.nom = nom
        patient.prenom = prenom
        patient.temps_preparation = TpsPrep
        patient.date_naissance = dateNaissance
        do{
            try context.save()
        }
        catch let error as NSError{
            self.alert(error: error)
            return
        }
    }
    
    @IBAction func unwindToContactListAfterSavingNewPerson(segue:UIStoryboardSegue) {
        let nom = NomTF.text ?? ""
        let prenom = PrenomTF.text ?? ""
        let tpsPrep = Int64(TpsPrepTF.text!)!
        let dateNaissance = DateNaissanceDP.date as NSDate
        self.saveNewPatient(nom: nom, prenom: prenom, dateNaissance: dateNaissance, TpsPrep: tpsPrep)
    }
    
    // MARK: - helper methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func getContext(errorMsg: String, userInfoMsg: String = "Could not retrieve data context") -> NSManagedObjectContext?{
        //get context of persistent data
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            self.alert(WithTitle: errorMsg, andMessage: userInfoMsg)
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }

    func alert(WithTitle title: String, andMessage msg: String = ""){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(cancelAction)
        present(alert,animated: true)
    }
    
    func alert(error: NSError){
        self.alert(WithTitle: "\(error)", andMessage: "\(error.userInfo)")
    }
}
