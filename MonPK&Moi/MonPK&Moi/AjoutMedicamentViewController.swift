//
//  AjoutMedicamentViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 05/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class AjoutMedicamentViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nomTF: UITextField!
    @IBOutlet weak var descTF: UITextField!
    @IBOutlet weak var dosageTF: UITextField!
    
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
    
    @IBAction func ValidateButton(_ sender: Any) {
        let nom = self.nomTF.text
        let desc = self.descTF.text
        let dosage = self.dosageTF.text
        self.saveNewMedicament(withname: nom!, withdesc: desc!, withdosage: dosage!)
        self.navigationController?.popViewController(animated: true)
    }

    func saveNewMedicament(withname name: String, withdesc desc: String, withdosage dosage: String){
        let medicament = MedicamentDAO(context: ManageCoreData.context)
        medicament.nom = name
        medicament.dosage = dosage
        medicament.desc_med = desc
        do{
            try ManageCoreData.context.save()
        }catch let error as NSError{
            ManageErrorHelper.alertError(view: self, error: error)
            return
        }
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
