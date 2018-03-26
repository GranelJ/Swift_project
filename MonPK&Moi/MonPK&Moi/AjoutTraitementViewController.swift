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
    @IBOutlet weak var timePicker: UIDatePicker!
    
    var pickerData: [Medicament] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        do{
            try pickerData = Medicament.getAll()
        }catch let error as NSError{
            ManageErrorHelper.alertError(view: self, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
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
        return pickerData.count

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row].nom + " " + pickerData[row].dosage

    }
    
    @IBAction func ValidateButton(_ sender: Any) {
        let medicamentrow = picker.selectedRow(inComponent: 0)
        let medicament = pickerData[medicamentrow]
        let heure = timePicker.date
        Traitement(forMomentPrise: heure, forMedicament: medicament.dao)
        self.performSegue(withIdentifier: "AddTraitement", sender: self)
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
