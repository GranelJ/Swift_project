//
//  AjouterRendezVousViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 06/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class AjouterRendezVousViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var libelleField: UITextField!
    @IBOutlet weak var heurePicker: UIDatePicker!
    @IBOutlet weak var medecinPiker: UIPickerView!
    
    @IBAction func validateButton(_ sender: Any) {
        self.saveNewRdv(withDate: datePicker.date, withLibelle: libelleField.text, withTime: heurePicker.date, withMedecin: medecinPiker.selectedRow(inComponent: 0))
        self.navigationController?.popViewController(animated: true)
    }
    
    func saveNewRdv(withDate date: Date?,withLibelle libelle: String?,withTime time: Date?,withMedecin medecin: MedecinDAO?){
        let rdv = RdvDAO(context: ManageCoreData.context)
        rdv.
        
        
        do{
            try ManageCoreData.context.save()
        }
        catch let error as NSError{
            ManageErrorHelper.alertError(view: self, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
