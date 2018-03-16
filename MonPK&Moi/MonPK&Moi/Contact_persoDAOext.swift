//
//  Contact_persoDAO.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension Contact_persoDAO {
    
    static func getNewContact_perso() -> Contact_persoDAO?{
        guard let entity = NSEntityDescription.entity(forEntityName: "Contact_persoDAO", in: ManageCoreData.context) else{
            return nil
        }
        let contact = Contact_persoDAO(entity: entity, insertInto: ManageCoreData.context)
        return contact
    }
    
    static func getAll() throws -> [Contact_persoDAO] {
        let request : NSFetchRequest<Contact_persoDAO> = Contact_persoDAO.fetchRequest()
        do {
            let contactL = try ManageCoreData.context.fetch(request)
            return contactL
        } catch let error as NSError {
            throw error
        }
    }
}
