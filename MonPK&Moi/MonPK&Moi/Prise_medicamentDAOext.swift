//
//  Prise_medicamentDAOext.swift
//  MonPK&Moi
//
//  Created by Justin ESCALIER on 15/03/2018.
//  Copyright © 2018 Joris GRANEL. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension Prise_medicamentDAO {
    
    static func getNewPrise_medicament() -> Prise_medicamentDAO?{
        guard let entity = NSEntityDescription.entity(forEntityName: "Prise_medicamentDAO", in: ManageCoreData.context) else{
            return nil
        }
        let prise = Prise_medicamentDAO(entity: entity, insertInto: ManageCoreData.context)
        return prise
    }
    
    static func getAll() throws -> [Prise_medicamentDAO] {
        let request : NSFetchRequest<Prise_medicamentDAO> = Prise_medicamentDAO.fetchRequest()
        do {
            let priseL = try ManageCoreData.context.fetch(request)
            return priseL
        } catch let error as NSError {
            throw error
        }
    }
}
