//
//  AjoutTraitementViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 05/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit
import UserNotifications

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
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, erro in})
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
        let trait = Traitement(forMomentPrise: heure, forMedicament: medicament.dao)
        let calendar = Calendar.current
        AddNotification(heure: calendar.component(.hour, from: heure), minute: calendar.component(.minute, from: heure), traitement: trait)
        self.performSegue(withIdentifier: "AddTraitement", sender: self)
    }

    
    public func AddNotification(heure: Int, minute: Int, traitement: Traitement){
        let content = UNMutableNotificationContent()
        content.title = "Prise de " + (traitement.dao.traitement_medicament?.nom)!
        content.body = "Rappel: Prenez votre médicament " + (traitement.dao.traitement_medicament?.nom)! + " " + (traitement.dao.traitement_medicament?.dosage)!
        if content.badge == 0{
            content.badge = NSNumber(integerLiteral: 1)
        }else{
            content.badge = UIApplication.shared.applicationIconBadgeNumber + 1 as NSNumber
        }
        
        var dateComponents = DateComponents()
        dateComponents.hour = heure
        dateComponents.minute = minute
        let notificationTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: notificationTrigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
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
