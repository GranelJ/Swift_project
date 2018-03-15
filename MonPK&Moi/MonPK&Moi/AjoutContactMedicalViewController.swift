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
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func saveNewMedecin(withName nom: String?,withNum num: String?,withMail mail: String?,withPrenom prenom: String?, withMetier metier: String?, withLieu lieu: String?){
        let medecin = Medecin(context: ManageCoreData.context)
        medecin.nom=nom
        medecin.telephone=num
        medecin.email=mail
        medecin.prenom=prenom
        medecin.profession=metier
        medecin.lieu_travail=lieu
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
