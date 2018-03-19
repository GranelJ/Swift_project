//
//  AjoutTraitementViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 05/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class AjoutTraitementViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var timepicker: UIPickerView!
    
    var pickerData: [MedicamentDAO] = []
    var timepickerData: [String] = ["8h", "12h", "16h", "20h"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        do{
            try pickerData = MedicamentDAO.getAll()
        }catch{
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == picker) {
            return pickerData.count
        }else{
            return timepickerData.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == picker) {
            return pickerData[row].nom! + " " + pickerData[row].dosage!
        }else{
            return timepickerData[row]
        }
    }
    
    @IBAction func ValidateButton(_ sender: Any) {
        let medicamentrow = picker.selectedRow(inComponent: 0)
        let medicament = pickerData[medicamentrow]
        let heure = timepicker.description
        saveNewTraitement(withmedicament: medicament, withheure: heure)
        self.navigationController?.popViewController(animated: true)
    }
    
    func saveNewTraitement(withmedicament medicament: MedicamentDAO, withheure heure: String) {
        let traitement = TraitementDAO(context: ManageCoreData.context)
        traitement.traitement_medicament = medicament
        traitement.moment_de_prise = heure
        do{
            try ManageCoreData.context.save()
        }catch let error as NSError{
            ManageErrorHelper.alertError(view: self, error: error)
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
