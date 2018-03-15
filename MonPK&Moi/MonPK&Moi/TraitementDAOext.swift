//
//  TraitementDAOext.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension TraitementDAO {
    
    static func getNewTraitement() -> TraitementDAO?{
        guard let entity = NSEntityDescription.entity(forEntityName: "TraitementDAO", in: ManageCoreData.context) else{
            return nil
        }
        let traitement = TraitementDAO(entity: entity, insertInto: ManageCoreData.context)
        return traitement
    }
    
    static func getAll() throws -> [TraitementDAO] {
        let request : NSFetchRequest<TraitementDAO> = TraitementDAO.fetchRequest()
        do {
            let traitementL = try ManageCoreData.context.fetch(request)
            return traitementL
        } catch let error as NSError {
            throw error
        }
    }
}
