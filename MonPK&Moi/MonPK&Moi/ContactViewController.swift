//
//  ContactViewController.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 05/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import UIKit
import CoreData

class ContactViewController: UIViewController {
    
    @IBOutlet weak var medecinsTable: UITableView!
    var medecins : [Medecin] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            self.alertError(errorMsg: "Could not load data", userInfo: "reason unknow")
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        
        let request : NSFetchRequest<Medecin> = Medecin.fetchRequest()
        do{
            try self.medecins = context.fetch(request)
        }
        catch let error as NSError{
            self.alertError(errorMsg: "\(error)", userInfo: "\(error.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertError(errorMsg error: String, userInfo user: String=""){
        let alert=UIAlertController(title: error, message: user, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(cancelAction)
        present(alert,animated: true)
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
