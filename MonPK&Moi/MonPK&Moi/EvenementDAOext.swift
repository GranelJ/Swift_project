//
//  EvenementDAOext.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension EvenementDAO {
    
    static func getNewEvenement() -> EvenementDAO?{
        guard let entity = NSEntityDescription.entity(forEntityName: "EvenementDAO", in: ManageCoreData.context) else{
            return nil
        }
        let evenement = EvenementDAO(entity: entity, insertInto: ManageCoreData.context)
        return evenement
    }
    
    static func getAll() throws -> [EvenementDAO] {
        let request : NSFetchRequest<EvenementDAO> = EvenementDAO.fetchRequest()
        do {
            let evenementL = try ManageCoreData.context.fetch(request)
            return evenementL
        } catch let error as NSError {
            throw error
        }
    }
}
