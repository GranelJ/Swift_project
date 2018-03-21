//
//  AjouterRendezVousViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 06/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class AjouterRendezVousViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource  {

    var pickerData: [MedecinDAO] = []
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var libelleField: UITextField!
    @IBOutlet weak var medecinPiker: UIPickerView!
    
    @IBAction func validateButton(_ sender: Any) {
        let medecinrow = medecinPiker.selectedRow(inComponent: 0)
        let medecin = pickerData[medecinrow]
        
        self.saveNewRdv(withDate: datePicker.date, withLibelle: libelleField.text, withMedecin: medecin)
        let newVC = self.storyboard?.instantiateViewController(withIdentifier: "AgendaViewController") as? AgendaViewController
        self.navigationController?.pushViewController(newVC!,animated: true)
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row].prenom! + " " + pickerData[row].nom!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do{
            try pickerData = MedecinDAO.getAll()
        }catch{
            
        }
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
