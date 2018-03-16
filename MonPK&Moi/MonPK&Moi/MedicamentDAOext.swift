//
//  MedicamentDAOext.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension MedicamentDAO {
    
    static func getNewMedicament() -> MedicamentDAO?{
        guard let entity = NSEntityDescription.entity(forEntityName: "MedicamentDAO", in: ManageCoreData.context) else{
            return nil
        }
        let medicament = MedicamentDAO(entity: entity, insertInto: ManageCoreData.context)
        return medicament
    }
    
    static func getAll() throws -> [MedicamentDAO] {
        let request : NSFetchRequest<MedicamentDAO> = MedicamentDAO.fetchRequest()
        do {
            let medicamentL = try ManageCoreData.context.fetch(request)
            return medicamentL
        } catch let error as NSError {
            throw error
        }
    }
}
