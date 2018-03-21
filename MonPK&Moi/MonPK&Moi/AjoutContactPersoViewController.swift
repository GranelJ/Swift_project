//
//  AjoutContactPersoViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 05/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit

class AjoutContactPersoViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var numLabel: UITextField!
    @IBOutlet weak var mailLabel: UITextField!
    @IBOutlet weak var firstNameLabel: UITextField!
    
    @IBAction func validateButton(_ sender: Any) {
        self.saveNewContact(withName: lastNameLabel.text, withNum: numLabel.text, withMail: mailLabel.text, withPrenom: firstNameLabel.text)
        let newVC = self.storyboard?.instantiateViewController(withIdentifier: "ContactViewController") as? ContactViewController
        self.navigationController?.pushViewController(newVC!,animated: true)
    }
    
    func saveNewContact(withName nom: String?,withNum num: String?,withMail mail: String?,withPrenom prenom: String?){
        let contact = Contact_persoDAO(context: ManageCoreData.context)
        contact.nom=nom
        contact.telephone=num
        contact.email=mail
        contact.prenom=prenom
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
        self.lastNameLabel.delegate = self
        self.numLabel.delegate = self
        self.mailLabel.delegate = self
        self.firstNameLabel.delegate = self
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
