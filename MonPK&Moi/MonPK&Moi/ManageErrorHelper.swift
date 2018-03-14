//
//  ManageErrorHelper.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 14/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation
import UIKit

class ManageErrorHelper{
    
    class func alertError(view : UIViewController, WithTitle title: String, andMessage msg: String = ""){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(cancelAction)
        view.present(alert,animated: true)
    }
    
   class func alertError(view: UIViewController, error: NSError){
        self.alertError(view: view, WithTitle: "\(error)", andMessage: "\(error.userInfo)")
    }
}
