//
//  ManageCoreData.swift
//  MonPK&Moi
//
//  Created by Joris GRANEL on 14/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ManageCoreData {
    static var context : NSManagedObjectContext{
        //get context of persistent data
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Erreur Application")
        }
        return appDelegate.persistentContainer.viewContext
    }
}
