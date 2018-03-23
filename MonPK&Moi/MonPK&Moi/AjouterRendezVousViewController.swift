//
//  AjouterRendezVousViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 06/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class AjouterRendezVousViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    var pickerData: [MedecinDAO] = []
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var libelleField: UITextField!
    @IBOutlet weak var medecinPiker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            try pickerData = MedecinDAO.getAll()
        }catch let error as NSError{
            ManageErrorHelper.alertError(view: self, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
        }
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
    
    @IBAction func ValidateButton(_ sender: Any) {
        let medecinrow = medecinPiker.selectedRow(inComponent: 0)
        let medecin = pickerData[medecinrow]
        let libelle = libelleField.text ?? ""
        guard ((libelle != "")) else{
            ManageErrorHelper.alertError(view: self, WithTitle: "Champ(s) Manquant(s)", andMessage: "Veuillez remplir tous les champs du formulaire")
            return
        }
        self.saveNewRdv(withDate: datePicker.date, withLibelle: libelle, withMedecin: medecin)
        self.performSegue(withIdentifier: "AddRDV", sender: self)
        }
    
    func saveNewRdv(withDate date: Date?,withLibelle libelle: String?,withMedecin medecin: MedecinDAO?){
        let rdv = RdvDAO(context: ManageCoreData.context)
        rdv.date_rdv=date! as NSDate
        rdv.libelle=libelle
        rdv.rdv_medecin=medecin
        
        do{
            try ManageCoreData.context.save()
        }
        catch let error as NSError{
            ManageErrorHelper.alertError(view: self, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
            return
        }
    }
    
    // MARK - Manage Picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row].prenom! + " " + pickerData[row].nom!
    }

}
