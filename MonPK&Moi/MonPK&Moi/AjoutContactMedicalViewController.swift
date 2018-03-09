//
//  AjoutContactMedicalViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 05/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit
import CoreData

class AjoutContactMedicalViewController: UIViewController {
    
    @IBOutlet weak var textNom: UITextField!
    @IBOutlet weak var textNum: UITextField!
    @IBOutlet weak var textMail: UITextField!
    @IBOutlet weak var textPrenom: UITextField!
    @IBOutlet weak var textMetier: UITextField!
    @IBOutlet weak var textLieu: UITextField!
    
    @IBAction func ValidateButton(_ sender: Any) {
        self.saveNewMedecin(withName: textNom.text, withNum: textNum.text, withMail: textMail.text, withPrenom: textPrenom.text, withMetier: textMetier.text, withLieu: textLieu.text)
    }
    
    func saveNewMedecin(withName nom: String?,withNum num: String?,withMail mail: String?,withPrenom prenom: String?, withMetier metier: String?, withLieu lieu: String?){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            self.alertError(errorMsg: "Le contact ne peut être ajouté", userInfo: "raison inconnu")
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let medecin = Medecin(context: context)
        medecin.nom=nom
        medecin.telephone=num
        medecin.email=mail
        medecin.prenom=prenom
        medecin.profession=metier
        medecin.lieu_travail=lieu
        do{
            try context.save()
        }
        catch let error as NSError{
            self.alertError(errorMsg: "\(error)", userInfo: "\(error.userInfo)")
            return
        }
    }
    
    func alertError(errorMsg error: String, userInfo user: String=""){
        let alert=UIAlertController(title: error, message: user, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(cancelAction)
        present(alert,animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
