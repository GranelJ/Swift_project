//
//  SignalEvenementViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 08/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class SignalEvenementViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    // MARK: - Variable creation
    
    @IBOutlet weak var eventTypePicker: UIPickerView!
    let pickerData: [String] = ["Somnolence", "Chute", "Hallucination", "Prise de dispersible", " Clic/bolus d'Apokinon"]
    @IBOutlet weak var descriptionTF: UITextField!
    
    // MARK: - Function for the view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.descriptionTF.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// Function used when the user press the validate button to add a event
    ///
    /// - Parameter sender: any
    @IBAction func ValidateButton(_ sender: Any) {
        let desc = descriptionTF.text ?? ""
        let evtType = eventTypePicker.description
        let date_evt = Date()
        if (desc != "") {
            Evenement(forDate: date_evt, forDesc: desc, forType: evtType)
            self.navigationController?.popViewController(animated: true)
        }else{
            ManageErrorHelper.alertError(view: self, WithTitle: "Champ(s) manquant(s)", andMessage: "Veuillez remplir tous les champs du formulaire")
            return
        }
    }
    
    // MARK: - Picker management
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    // MARK: - Keyboard management for textfield
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
