//
//  SignalEvenementViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 08/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class SignalEvenementViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var eventTypePicker: UIPickerView!
    let pickerData: [String] = ["Somnolence", "Chute", "Hallucination", "Prise de dispersible", " Clic/bolus d'Apokinon"]
    @IBOutlet weak var descriptionTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.descriptionTF.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ValidateButton(_ sender: Any) {
        let desc = descriptionTF.text ?? ""
        let evtType = eventTypePicker.description
        guard (desc != "") else{
            ManageErrorHelper.alertError(view: self, WithTitle: "Champ(s) Manquant(s)", andMessage: "Veuillez remplir tous les champs du formulaire")
            return
        }
        saveNewEvenement(withdesc: desc, witheventtype: evtType)
        self.navigationController?.popViewController(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func saveNewEvenement(withdesc desc: String, witheventtype evttype: String){
        let event = EvenementDAO(context: ManageCoreData.context)
        event.desc_evt = desc
        event.type = evttype
        do{
            try ManageCoreData.context.save()
        }catch let error as NSError{
            ManageErrorHelper.alertError(view: self, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
            return
        }
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
