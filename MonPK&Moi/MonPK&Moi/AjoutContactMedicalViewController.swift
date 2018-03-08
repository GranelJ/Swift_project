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
