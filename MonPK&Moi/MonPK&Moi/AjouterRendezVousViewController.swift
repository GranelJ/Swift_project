//
//  AjouterRendezVousViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 06/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class AjouterRendezVousViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    var pickerData: [Medecin] = []
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var libelleField: UITextField!
    @IBOutlet weak var medecinPiker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            try pickerData = Medecin.getAll()
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
        let date = datePicker.date
        let lib = libelleField.text ?? ""
        if (lib != "") {
            let myRdv = Rdv(forDate: date, forLibelle: lib, forMedecin: medecin.dao, forSynthese: nil)
            if(myRdv.dao.rdv_medecin?.profession == "Neurologue"){
                Synthese(forHeureDebut: 7, forHeureFin: 20, forPeriodicite: 1, forRdv: myRdv.dao)
            }else{
                
            }
            self.performSegue(withIdentifier: "AddRDV", sender: self)
        }else{
            ManageErrorHelper.alertError(view: self, WithTitle: "Champ(s) manquant(s)", andMessage: "Veuillez remplir tous les champs du formulaire")
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
        return pickerData[row].prenom + " " + pickerData[row].nom
    }

}
